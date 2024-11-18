return {
    'Vonr/align.nvim',
    branch = "v2",
    lazy = true,
    init = function()
    local NS = { noremap = true, silent = true }

    keymap.set('x', 'ad', function() require'align'.align_to_char({ preview = true, length = 2 }) end, NS, {desc = "align by character with live preview"})
    
        -- Create your mappings here
    end
}
