return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				systemverilog = { "verible" },
				verilog = { "verible" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			formatters = {
				verible = {
					command = "verible-verilog-format",
					args = {
						"--indentation_spaces=2",
						"--column_limit=100",
						"--assignment_statement_alignment=align",
						"--module_net_variable_alignment=align",
						"-",
					},
					stdin = true,
				},
			},
			--     format_on_save = {
			--       lsp_fallback = true,
			--       async = false,
			--       timeout_ms = 1000,
			--     },
		})

		-- General format keybinding (works with visual selection or whole file)
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		-- Dedicated Verible format and align keybinding
		vim.keymap.set({ "n", "v" }, "<leader>vf", function()
			conform.format({
				formatters = { "verible" },
				lsp_fallback = false,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format and align with Verible" })
	end,
}
