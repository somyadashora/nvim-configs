# Zephyr module entry point -- see zephyr/module.yml for why this is here.
#
# Everything is behind the display Kconfig so the settings_reset image, which
# has no display at all, compiles none of it.

if(CONFIG_ZMK_DISPLAY AND CONFIG_ZMK_DISPLAY_STATUS_SCREEN_CUSTOM)
  zephyr_library()

  # ZMK declares its own headers PRIVATE (`target_include_directories(app
  # PRIVATE include)` in zmk/app/CMakeLists.txt), so a module gets none of
  # them by default and <zmk/display/...> will not resolve. The build is
  # rooted at zmk/app, so CMAKE_SOURCE_DIR/include is that private include
  # directory. This is the same line ZMK's own nice_view shield uses.
  zephyr_library_include_directories(${CMAKE_SOURCE_DIR}/include)

  zephyr_library_sources(display/status_screen.c)
  zephyr_library_sources(display/ext_power_boot.c)

  # The logo is peripheral-only, so the central half does not carry the
  # bitmap in flash for nothing.
  if(CONFIG_ZMK_SPLIT AND NOT CONFIG_ZMK_SPLIT_ROLE_CENTRAL)
    zephyr_library_sources(display/sd_logo.c)
  endif()
endif()
