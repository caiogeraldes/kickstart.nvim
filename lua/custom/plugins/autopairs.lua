-- File: lua/custom/plugins/autopairs.lua

return {
  'windwp/nvim-autopairs',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {}

    -- Adding rules for LaTeX
    require('nvim-autopairs').getrules('`')[1].not_filetypes = { 'tex' }
    local Rule = require 'nvim-autopairs.rule'
    local npairs = require 'nvim-autopairs'
    npairs.add_rule(Rule('`', "'", 'tex'))
    npairs.add_rule(Rule('$', '$', 'tex'))

    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
