return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	lazy = false,
	dependencies = {
		{
			"nvim-lua/plenary.nvim",
		},
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		{
			"nvim-telescope/telescope-ui-select.nvim",
		},
	},
	config = function()
		-- local builtin = require("telescope.builtin")
		-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		-- vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".pdf",
					".png",
					".jpg",
					".jpeg",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- allow typos
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")
	end,
	keys = {
		{
			"<C-p>",
			":Telescope find_files<CR>",
			desc = "Find files",
		},
		{
			"<C-f>",
			":Telescope live_grep<CR>",
			desc = "Live grep",
		},
	},
}
