return {
    "lukas-reineke/virt-column.nvim",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
        char ={"┆", "⸽", "┆"},
        virtcolumn = "100,120,121",
        highlight = "WinSeparator",
    },
    config = function(_, opts)
        vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#cbe0f0" })
        require("virt-column").setup(opts)
    end,
}