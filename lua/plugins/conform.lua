local clang_format_opts =
	"-style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 100, AllowShortFunctionsOnASingleLine: Empty, DerivePointerAlignment: false, PointerAlignment: Right, SortIncludes: true, SpaceBeforeAssignmentOperators: true, TabWidth: 4}"

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				["clang-format"] = {
					inherit = true,
					prepend_args = {
						clang_format_opts,
					},
				},
			},
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				haskell = { "fourmolu" },
				lua = { "stylua" },
				python = { "ruff format" },
				racket = { "raco fmt" },
				rust = { "rustfmt" },
				typst = { "typstfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
