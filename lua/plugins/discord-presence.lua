return {
    "andweeb/presence.nvim",
    config = function ()
        require("presence").setup({
            auto_update = true,
            neovim_image_text = "VSCode Premium Edition",
            main_image = "file",
            -- enable_line_number = true,
            show_time = true,
            buttons = false,
        })
    end,
}
