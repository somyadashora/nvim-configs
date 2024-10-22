return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },
  config = function()
    require("bufferline").setup{
      options = {
        buffer_close_icon = "x",
        close_icon = "x",
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "Fle Explorer",
            text_align = "left",
            seperator = true
          }
        }
      }
    }
    
    local keymap = vim.keymap

    keymap.set("n", "<leader>bg", "<cmd>BufferLinePick<cr>", {desc = "Naviation to open buffer using mapped keys"})
    keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", {desc = "Naviation to Next buffer in bufferlist"})
    keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", {desc = "Naviation to prev buffer in bufferlist"})
    
    keymap.set("n", "<leader>bcr", "<cmd>BufferLineCloseRight<cr>", {desc = "Close all buffers to the Right of current buffer"})
    keymap.set("n", "<leader>bcl", "<cmd>BufferLineCloseLeft<cr>", {desc = "Close all buffers to the Left of current buffer"})
    keymap.set("n", "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", {desc = "Close all other buffers"})
    keymap.set("n", "<leader>bC", "<cmd>BufferLinePickClose<cr>", {desc = "Close a buffer using mapped keys"})
  end
}
