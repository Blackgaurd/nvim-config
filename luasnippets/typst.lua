local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

-- vimtex environment functions
local line_begin = require("luasnip.extras.conditions.expand").line_begin

-- typst detection functions
local function in_markup()
	return vim.api.nvim_eval("typst#in_markup()") == 1
end

local function in_math()
	return vim.api.nvim_eval("typst#in_math()") == 1
end

local function in_code()
	return vim.api.nvim_eval("typst#in_code()") == 1
end

local function in_comment()
	return vim.api.nvim_eval("typst#in_comment()") == 1
end

-- variables
local greek_letters = {
	a = "alpha",
	b = "beta",
	c = "chi",
	d = "delta",
	e = "epsilon",
	f = "phi",
	g = "gamma",
	h = "eta",
	i = "iota",
	k = "kappa",
	l = "lambda",
	m = "mu",
	n = "nu",
	o = "omega",
	p = "pi",
	q = "theta",
	r = "rho",
	s = "sigma",
	t = "tau",
	u = "upsilon",
	x = "xi",
	y = "psi",
	z = "zeta",
	F = "Phi",
	G = "Gamma",
	D = "Delta",
	L = "Lambda",
	O = "Omega",
	P = "Pi",
	Q = "Theta",
	S = "Sigma",
	T = "Tau",
	U = "Upsilon",
	X = "Xi",
	Y = "Psi",
}

local snippets = {
	s({
		trig = "@([a-zA-Z])",
		trigEngine = "pattern",
		name = "greek letters",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		f(function(_, snip)
			local cap = snip.captures[1]
			local letter = greek_letters[cap]
			if letter then
				return letter
			end
			return ""
		end),
	}, {
		condition = in_math,
	}),
	s({
		trig = "sse",
		trigEngine = "plain",
		name = "subset.eq",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		t("subset.eq"),
	}, {
		condition = in_math,
	}),
}

return snippets
