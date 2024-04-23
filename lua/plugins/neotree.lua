return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- vim.cmd ":Neotree"
        vim.keymap.set("n", "<C-b>", ":Neotree filesystem toggle left<CR>", { silent = true })
        vim.keymap.set("n", "<leader>b", ":Neotree buffers toggle left<CR>", { silent = true })
    end
}

