return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter',
        lazy = true,
        config = function() end,
      },
    },
    event = 'VeryLazy',
    config = function()
      -- Load treesitter grammar for org
      require('orgmode').setup_ts_grammar()

      -- Setup orgmode
      require('orgmode').setup {
        org_statup_folded = 'inherit',
        org_agenda_files = '~/docs/orgfiles/**/*',
        org_default_notes_file = '~/docs/orgfiles/refile.org',
        mappings = {
          disable_all = false,
          org_return_uses_meta_return = false,
          prefix = '<Leader>O',
          global = {
            org_agenda = '<prefix>a',
            org_capture = '<prefix>c',
          },
        },
      }

      vim.cmd [[setlocal nofoldenable]] -- No folds initially
    end,
  },
}
