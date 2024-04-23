return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function ()
            local ls = require("luasnip")

            ls.setup({
                keep_roots = false,
                link_roots = false,
                link_children = false,

                -- update snippets in real time
                updateevents = { "TextChanged", "TextChangedI" },
                enable_autosnippets = true,
                delete_check_events = { "InsertLeave" },
            })

            -- import snippet files
            require("luasnip.loaders.from_lua").lazy_load({
                paths = {
                    "./luasnippets",
                }
            })
        end,
    },
    {
        'saadparwaiz1/cmp_luasnip',
    }
}
