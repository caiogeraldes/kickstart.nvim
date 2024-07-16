return {
  'saecki/crates.nvim',
  tag = 'stable',
  config = function()
    require('crates').setup {
      cmp = { enabled = true },
    }
  end,
}
