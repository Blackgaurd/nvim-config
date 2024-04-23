local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

return {
    s({
        trig = "test",
        snippetType = "autosnippet",
    }, {
        t({ "", "}" }),
    })
}
