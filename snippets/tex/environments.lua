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

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  -- Begin - End
  s(
    '\\begin',
    fmta(
      [[
      \begin{<env>}
      <cont>
      \end{<env>}
    ]],
      { env = i(1), cont = i(2) },
      { repeat_duplicates = true }
    )
  ),
  -- Center block
  s(
    'center',
    fmta(
      [[
      \begin{center}
      <>
      \end{center}
    ]],
      { d(1, get_visual) }
    )
  ),
}
