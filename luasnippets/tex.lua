---@diagnostic disable: unused-local
-- .tex files

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

local function env(name)
	local is_inside = vim.fn["vimtex#env#is_inside"](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

local function in_math()
	return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local function in_text()
	return env("document") and not in_math()
end

local function in_bullets()
	return env("itemize") or env("enumerate")
end

-- variables
local greek_letters = {
	a = "alpha",
	b = "beta",
	c = "chi",
	d = "delta",
	e = "varepsilon",
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

local matching_brackets = {
	["("] = ")",
	["["] = "]",
	["{"] = "}",
}

return {
	-- math snippets
	s({
		trig = "@([a-zA-Z])",
		trigEngine = "pattern",
		name = "greek letters",
		dscr = "insert greek letter",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		f(function(_, snip)
			local cap = snip.captures[1]
			local letter = greek_letters[cap]
			if letter then
				return "\\" .. letter
			end
			return ""
		end),
	}, {
		condition = in_math,
	}),
	s({
		trig = "([A-Za-z]+)[Cc][Aa][Ll]",
		trigEngine = "ecma",
		name = "mathcal",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		f(function(_, snip)
			local cap = snip.captures[1]
			return "\\mathcal{" .. cap .. "}"
		end),
	}, {
		condition = in_math,
	}),
	s({
		trig = "([A-Za-z]+)[Bb][Bb]",
		trigEngine = "ecma",
		name = "mathbb",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		f(function(_, snip)
			local cap = snip.captures[1]
			return "\\mathbb{" .. cap .. "}"
		end),
	}, {
		condition = in_math,
	}),
	s({
		trig = "([A-Za-z]+)[Ff][Rr][Aa][Kk]",
		trigEngine = "ecma",
		name = "mathfrak",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		f(function(_, snip)
			local cap = snip.captures[1]
			return "\\mathfrak{" .. cap .. "}"
		end),
	}, {
		condition = in_math,
	}),
	s({
		trig = "(?<=,)\\s*\\.\\.\\.",
		trigEngine = "ecma",
		name = "smart ldots",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		t(" \\ldots"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "(?<=[-+=])\\s*\\.\\.\\.",
		trigEngine = "ecma",
		name = "smart cdots",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		t(" \\cdots"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\ems",
		trigEngine = "plain",
		name = "empty set",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		t("\\varempty"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\deq",
		trigEngine = "plain",
		name = "define equals",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		t("\\defeq"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\mt",
		trigEngine = "plain",
		name = "mapsto",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		t("\\mapto"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\sse",
		trigEngine = "plain",
		name = "subseteq",
		dscr = "subset or equal",
		snippetType = "autosnippet",
		-- hidden = true,
	}, {
		t("\\subseteq"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\comp",
		trigEngine = "plain",
		name = "compose",
		dscr = "function composition",
		snippetType = "autosnippet",
		-- hidden = true,
	}, {
		t("\\circ"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\rra",
		trigEngine = "plain",
		name = "right right arrow",
		dscr = "uniform continuity",
		snippetType = "autosnippet",
		-- hidden = true,
	}, {
		t("\\rightrightarrow"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\floor",
		trigEngine = "plain",
		name = "floor",
		snippetType = "autosnippet",
		-- hidden = true,
	}, {
		t("\\lfloor "),
		i(1),
		t(" \\rfloor"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\ceil",
		trigEngine = "plain",
		name = "ceil",
		snippetType = "autosnippet",
		-- hidden = true,
	}, {
		t("\\lceil "),
		i(1),
		t(" \\rceil"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "//",
		trigEngine = "plain",
		name = "simple fraction",
		snippetType = "autosnippet",
	}, {
		t("\\frac{"),
		i(1),
		t("}{"),
		i(2),
		t("}"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "((\\d+)|(\\d*)(\\\\)?([A-Za-z]+)((\\^|_)(\\{\\d+\\}|\\d))*)/",
		trigEngine = "ecma",
		name = "auto fraction no brackets",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		t("\\frac{"),
		f(function(_, snip)
			local cap = snip.captures[1]
			return cap
		end),
		t("}{"),
		i(1),
		t("}"),
	}, {
		condition = in_math,
	}),
	s({
		trig = "(^.*\\))/",
		trigEngine = "ecma",
		name = "auto fraction with brackets",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		d(1, function(_, snip)
			local cap = snip.captures[1]

			local depth = 0
			local ind = #cap

			while true do
				if ind <= 1 then
					return sn(nil, {
						t(cap .. "/"),
					})
				end

				local ch = cap:sub(ind, ind)
				if ch == ")" then
					depth = depth + 1
				elseif ch == "(" then
					depth = depth - 1
				end

				if depth == 0 then
					break
				end
				ind = ind - 1
			end

			return sn(
				nil,
				fmta(
					[[
            <>\frac{<>}{<>}
            ]],
					{ t(cap:sub(1, ind - 1)), t(cap:sub(ind + 1, -2)), i(1) }
				)
			)
		end),
	}, {
		condition = in_math,
	}),
	s({
		trig = "\\left([\\[\\({])",
		trigEngine = "ecma",
		name = "left/right brackets",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		d(1, function(_, snip)
			local open = snip.captures[1]
			local close = matching_brackets[open]
			return sn(nil, t("\\left" .. open .. " "), i(1), t("\\right "))
		end),
	}, {
		condition = in_math,
	}),

	-- non-math snippets
	s({
		trig = "\\verb",
		trigEngine = "plain",
		name = "monospace text",
		snippetType = "autosnippet",
		hidden = true,
	}, {
		t("\\verb|"),
		i(1),
		t("|"),
	}, {
		condition = in_text,
	}),
	s({
		trig = "dm",
		trigEngine = "plain",
		name = "display math",
		snippetType = "autosnippet",
	}, {
		t("\\[ "),
		i(1),
		t(" \\]"),
	}, {
		condition = in_text,
	}),
	s({
		trig = "BEN",
		trigEngine = "plain",
		name = "begin enumerate",
	}, {
		t({ "\\begin{enumerate}", "    \\item" }),
		i(1),
		t({ "", "\\end{enumerate}" }),
	}, {
		condition = in_text,
	}),
	s({
		trig = "BIT",
		trigEngine = "plain",
		name = "begin itemize",
	}, {
		t({ "\\begin{itemize}", "    \\item" }),
		i(1),
		t({ "", "\\end{itemize}" }),
	}, {
		condition = in_text,
	}),
	s({
		trig = "BAL",
		trigEngine = "plain",
		name = "begin align",
	}, {
		t({ "\\begin{align}", "    " }),
		i(1),
		t({ "", "\\end{align}" }),
	}, {
		condition = in_text,
	}),
	s({
		trig = "BSAL",
		trigEngine = "plain",
		name = "begin silent align",
	}, {
		t({ "\\begin{align*}", "    " }),
		i(1),
		t({ "", "\\end{align*}" }),
	}, {
		condition = in_text,
	}),
	s({
		trig = "BGA",
		trigEngine = "plain",
		name = "begin gather",
	}, {
		t({ "\\begin{gather}", "    " }),
		i(1),
		t({ "", "\\end{gather}" }),
	}, {
		condition = in_text,
	}),
	s({
		trig = "BSGA",
		trigEngine = "plain",
		name = "begin silent gather",
	}, {
		t({ "\\begin{gather*}", "    " }),
		i(1),
		t({ "", "\\end{gather*}" }),
	}, {
		condition = in_text,
	}),
	s({
		trig = "\\beg",
		trigEngine = "plain",
		name = "begin environment",
		snippetType = "autosnippet",
	}, {
		t("\\begin{"),
		i(1),
		t({ "}", "    " }),
		i(0),
		t("\\end{"),
		rep(1),
		t("}"),
	}),
}
