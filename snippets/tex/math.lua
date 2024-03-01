-- Abbreviations used in this article and the LuaSnip docs
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  s({
    trig = '\\prob',
    dscr = "An autotriggering snippet that expands '\\prob' into '\\text{Pr}(<1>) '",
    regTrig = false,
    priority = 100,
    snippetType = 'autosnippet',
  }, {
    t '\\text{Pr}(',
    i(1),
    t ') ',
  }),

  s(
    {
      trig = '\\dens',
      dscr = "An autotriggering snippet that expands '\\dens' into '\\text{<1>}(<2>) '",
      regTrig = false,
      priority = 100,
      snippetType = 'autosnippet',
    },
    fmta(
      [[
    \text{<1>}(<2>) 
    ]],
      { i(1, 'Binomial'), i(2, 'p') }
    )
  ),
}
