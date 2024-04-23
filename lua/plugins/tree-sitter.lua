return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "css", "svelte", "markdown", "python", "latex", "c", "cpp", "haskell", "racket" },
            highlight = { enabled = true },
            indent = { enabled = true },
            auto_install = true,
        })
    end
}

