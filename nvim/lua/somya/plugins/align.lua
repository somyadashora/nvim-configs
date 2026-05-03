return {
    'Vonr/align.nvim',
    branch = "v2",
    lazy = true,
    init = function()
        local NS = { noremap = true, silent = true }
        local keymap = vim.keymap -- for conciseness

        -- Create your mappings here
        keymap.set("x", "<leader>Ac", function()require'align'.align_to_char({ preview = true, length = 1 }) end, NS)
        keymap.set("x", "<leader>A2c", function()require'align'.align_to_char({ preview = true, length = 2 }) end, NS)

        keymap.set("x", "<leader>As", function()require'align'.align_to_string({ preview = true, regex = false }) end, NS) -- Aligns to a string with previews
        keymap.set("x", "<leader>Ar", function()require'align'.align_to_string({ preview = true, regex = true }) end, NS) -- Aligns to a vim regex with previews

        keymap.set("x", "<leader>AR", function()require'align'.align_to_string({ preview = false, regex = true }) end, NS) -- Aligns to a vim regex without previews

        keymap.set("n", "<leader>Ap", function() local a = require'align' a.operator( a.align_to_string, { regex = false, preview = true, }) end, NS) --to align a paragraph to a string with previews
    end
}
