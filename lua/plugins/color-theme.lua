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

local kanagawa = {
	"rebelot/kanagawa.nvim",
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			theme = "dragon",
		})
		vim.cmd.colorscheme("kanagawa")
	end,
}

local material = {
	"marko-cerovac/material.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("material")
		vim.g.material_style = "darker"
	end,
}

return catppuccin
