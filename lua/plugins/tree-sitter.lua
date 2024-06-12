return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"c",
					"cpp",
					"css",
					"haskell",
					"html",
					"javascript",
					"latex",
					"lua",
					"markdown",
					"python",
					"racket",
					"svelte",
					"typescript",
				},
				highlight = { enabled = true },
				indent = { enabled = true },
				auto_install = true,
			})
		end,
	},
	--[[ {
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				multiline_threshold = 3,
			})
		end,
	}, ]]
}
