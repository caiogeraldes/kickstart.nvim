return {
  'norcalli/nvim-colorizer.lua',
  lazy = false,
  config = function()
    require('colorizer').setup {
      'config',
      'lua',
      'ini',
      'yaml',
      'toml',
      css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
      html = {
        mode = 'foreground',
      },
    }
  end,
}
