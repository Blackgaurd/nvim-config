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

-- custom command
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent=true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent=true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent=true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent=true })

-- filetypes
vim.filetype.add({
    extension = {
        svx = "markdown",
    }
})

-- set unnamed register to clipboard
vim.cmd("set clipboard=unnamedplus")

-- custom commands
-- remove all trailing white space on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
