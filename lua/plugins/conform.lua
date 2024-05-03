--[[
BasedOnStyle: Google
IndentWidth: 4
ColumnLimit: 100
AllowShortFunctionsOnASingleLine: Empty
DerivePointerAlignment: false
PointerAlignment: Left
SortIncludes: true
SpaceBeforeAssignmentOperators: true
TabWidth: 4
]]

local clang_format_opts =
	"{BasedOnStyle:Google,IndentWidth:4,ColumnLimit:100,AllowShortFunctionsOnASingleLine:Empty,DerivePointerAlignment:false,PointerAlignment:Left,SortIncludes:true,SpaceBeforeAssignmentOperators:true,TabWidth:4}"

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" .. clang_format_opts },
				cpp = { "clang-format" .. clang_format_opts },
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
