return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	opts = {},
	config = function(_, opts)
		require("fidget").setup(opts)
		vim.notify = require("fidget").notify
	end,
}
