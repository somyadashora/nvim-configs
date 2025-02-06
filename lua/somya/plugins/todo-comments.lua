return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup{
      -- keywords recognized as todo comments in VLSI
      keywords = {
        FIXME = {
          -- icon = "? ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIX" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { color = "info" },
        REVIEW = { color = "warning", alt = { "WARNING" } },
        PERF = { alt = { "IMPORTANT" } },
        SPEC = { alt = { "SPECIFICATION" } },
        NOTE = { color = "hint", alt = { "INFO" } },
      },

      -- keywords recognized as todo comments
      -- keywords = {
      --   FIX = {
      --     -- icon = "? ", -- icon used for the sign, and in search results
      --     color = "error", -- can be a hex color, or a named color (see below)
      --     alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      --     -- signs = false, -- configure signs for some keywords individually
      --   },
      --   TODO = { color = "info" },
      --   HACK = { color = "warning" },
      --   WARN = { color = "warning", alt = { "WARNING", "XXX", "REVIEW" } },
      --   PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "IMPORTANT", "LGTM" } },
      --   SPEC = { alt = { "SPECIFICATION" } },
      --   NOTE = { color = "hint", alt = { "INFO" } },
      --   TEST = { color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      -- },

      

    }
  end,
}
