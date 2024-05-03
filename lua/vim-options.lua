-- leader
vim.g.mapleader = " "

-- indentation
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.cmd("set shiftround")
vim.cmd("set smarttab")

-- search
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

-- text rendering
vim.cmd("set linebreak")
vim.cmd("set scrolloff=2")
vim.cmd("set sidescroll=5")

-- line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("autocmd InsertEnter * set norelativenumber")
vim.cmd("autocmd InsertLeave * set relativenumber")

-- set unnamed register to clipboard
vim.cmd("set clipboard=unnamedplus")

-- highlight current line
vim.cmd("set cursorline")
vim.cmd("autocmd InsertEnter * set nocursorline")
vim.cmd("autocmd InsertLeave * set cursorline")

-- custom command
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })

-- filetypes
vim.filetype.add({
	extension = {
		svx = "markdown",
	},
})
vim.cmd("autocmd FileType haskell setlocal shiftwidth=2 softtabstop=2 expandtab")

-- custom commands
-- remove all trailing white space on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- lsp diagnostics
vim.diagnostic.config({ virtual_text = false })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { silent = true })
vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("n", "<leader>p", vim.diagnostic.goto_prev, { silent = true })

-- set up LSP signs
for type, icon in pairs({
	Error = "",
	Warn = "",
	Hint = "",
	Info = "",
}) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
