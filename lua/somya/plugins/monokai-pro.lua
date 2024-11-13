return {
	-- Monokai Pro theme with multiple filters: Pro, Classic, Machine, Octagon,
	-- Ristretto, Spectrum.
	{
		'loctvl842/monokai-pro.nvim',
		lazy = false,
		priority = 1000,
		opts = {
			filter = 'pro', -- classic | octagon | pro | machine | ristretto | spectrum
			styles = {
                        comment = { italic = true },
                        keyword = { italic = true }, -- any other keyword
                        type = { italic = true }, -- (preferred) int, long, char, etc
                        storageclass = { italic = true }, -- static, register, volatile, etc
                        structure = { italic = true }, -- struct, union, enum, etc
                        parameter = { italic = true }, -- parameter pass in function
                        annotation = { italic = true },
                        tag_attribute = { italic = true }, -- attribute of tag in reactjs
                        },
			plugins = {
				bufferline = {
					underline_selected = false,
					underline_visible = false,
				},
				indent_blankline = {
					context_highlight = 'pro', -- default | pro
					context_start_underline = false,
				},
			},
		},
	},
}
