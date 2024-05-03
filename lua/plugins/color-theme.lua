---@diagnostic disable: unused-local

local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-frappe")
	end,
}

local onedark = {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").load()
	end,
}

local onedarkpro = {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("onedark")
	end,
}

return catppuccin
