return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      FIXME = {
        color = "error",
        alt = { "FIX" },
      },
      TODO = { color = "info" },
      REVIEW = { color = "warning", alt = { "WARNING" } },
      PERF = { alt = { "IMPORTANT" } },
      SPEC = { alt = { "SPECIFICATION" } },
      NOTE = { color = "hint", alt = { "INFO" } },
    },
  },
  init = function()
    local keymap = vim.keymap
    keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })
    keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })
  end,
}
