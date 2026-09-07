/*
 * Force the nice!nano's external power rail on at boot.
 *
 * WHY THIS EXISTS. P0.13 feeds the per-key LEDs and the OLED from one rail,
 * and ZMK persists that rail's on/off state to flash -- its docs say plainly
 * that the state "will be saved to flash storage and hence persist across
 * restarts and firmware flashes". So a board that ever cut the rail (which
 * every build before CONFIG_ZMK_RGB_UNDERGLOW_EXT_POWER=n did, on idle) boots
 * with dark OLEDs forever, and no amount of reflashing fixes it: the setting
 * outlives the firmware that wrote it. The manual repair is ADJ+EPTOG, then a
 * 60-second wait for CONFIG_ZMK_SETTINGS_SAVE_DEBOUNCE, then a reboot. That is
 * a ritual nobody should have to know.
 *
 * WHERE IT RUNS, AND WHY THERE. zmk/app/src/main.c is:
 *
 *     settings_subsys_init();
 *     settings_load();          <- ext_power's commit handler applies the
 *                                  saved state here, possibly cutting the rail
 *     zmk_display_init();       <- calls zmk_display_status_screen(), i.e. us
 *
 * so calling this from the top of our status screen is the first opportunity
 * after the stale setting has been applied. A SYS_INIT would be too early --
 * every init level runs before main() -- and a settings commit handler of our
 * own would race ZMK's on link order.
 *
 * WHAT IT CANNOT DO. The SSD1306's own init sequence runs in the Zephyr driver
 * at POST_KERNEL, before main(). If the rail is cut during settings_load the
 * panel loses that init, and ZMK has no re-init path (zmkfirmware/zmk#674 --
 * the reason its docs still call displays a proof of concept). Re-powering it
 * here may or may not be soon enough to avoid a brown-out; the window is
 * microseconds and depends on the panel's decoupling.
 *
 * That does not matter beyond the first boot. ext_power_enable() also queues
 * the state back to flash, so once the board has been up for the debounce
 * period the saved state is ON, settings_load stops cutting the rail, and
 * every later boot has continuous power from POST_KERNEL onwards. And because
 * this runs unconditionally on every boot rather than trusting what was
 * saved, the dark-OLED state cannot be re-entered even if the save never
 * lands.
 */

#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/devicetree.h>

#include <zephyr/logging/log.h>
LOG_MODULE_DECLARE(zmk, CONFIG_ZMK_LOG_LEVEL);

#include "ext_power_boot.h"

#if IS_ENABLED(CONFIG_ZMK_EXT_POWER) && DT_HAS_COMPAT_STATUS_OKAY(zmk_ext_power_generic)

#include <drivers/ext_power.h>

/* Same accessor ZMK's own rgb_underglow.c uses -- DT_INST with an explicit
 * compatible, so no DT_DRV_COMPAT has to be defined in this file. */
static const struct device *const ext_power = DEVICE_DT_GET(DT_INST(0, zmk_ext_power_generic));

void sd_force_ext_power_on(void) {
    if (!device_is_ready(ext_power)) {
        LOG_ERR("ext power device not ready; leaving the rail alone");
        return;
    }

    /* Unconditional, not a get()-then-enable: the point is that the outcome
     * does not depend on the stored state. enable() is idempotent and queues
     * the save itself. */
    int rc = ext_power_enable(ext_power);
    if (rc != 0) {
        LOG_ERR("failed to force ext power on: %d", rc);
    } else {
        LOG_INF("ext power forced on for the display");
    }
}

#else

void sd_force_ext_power_on(void) {}

#endif
