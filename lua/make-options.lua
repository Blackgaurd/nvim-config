-- typst, plugin already does it
--[[ vim.cmd("autocmd FileType typst let b:dirname=fnamemodify(expand('%:p:h'), ':p')")
vim.cmd("autocmd FileType typst setlocal makeprg=typst\\ compile\\ %:p\\ ./%:t:r") ]]
