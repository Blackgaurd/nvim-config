---@diagnostic disable: unused-local

local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}

local onedark = {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").load()
	end,
}

return onedark
