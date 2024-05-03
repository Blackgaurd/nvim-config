return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle left<CR>", { silent = true })
		vim.keymap.set("n", "<leader>b", ":Neotree buffers toggle left<CR>", { silent = true })

		require("neo-tree").setup({
			window = {
				width = 30,
			},
			filesystem = {
				filtered_items = {
					always_show = {
						".gitignore",
					},
				},
			},
		})
	end,
}
