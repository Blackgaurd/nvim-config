return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",   -- lua
                    "bashls",   -- bash
                    "clangd",   -- c/c++
                    "gopls",    -- go
                    "tsserver", -- js/ts
                    "ltex",     -- latex
                    "pyright",  -- python
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.bashls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.gopls.setup({ capabilities = capabilities })
            lspconfig.tsserver.setup({ capabilities = capabilities })
            lspconfig.ltex.setup({ capabilities = capabilities })
            lspconfig.pyright.setup({ capabilities = capabilities })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
        end
    },
}
