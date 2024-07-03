return {
  'emmanueltouzery/decisive.nvim',
  config = function()
    require('decisive').setup {}
  end,
  lazy = true,
  event = 'VeryLazy',
  ft = { 'csv' },
}
