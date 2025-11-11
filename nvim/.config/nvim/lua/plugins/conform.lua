return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			sh = { "shfmt" },
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			cpp = { "clang-format" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		notify_on_error = true,
		notify_no_formatters = true,
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format File",
		},
	},
}
