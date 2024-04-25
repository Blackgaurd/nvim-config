return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				haskell = { "fourmolu" },
				lua = { "stylua" },
				python = { "ruff format" },
				rust = { "rustfmt" },
				racket = { "raco fmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
