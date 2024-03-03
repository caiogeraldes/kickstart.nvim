-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local function map(mode, lhs, rhs, opts)
          opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
        map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

        -- Hunk Actions
        map('n', '<leader>ghs', ':Gitsigns stage_hunk<CR>', { desc = '[S]tage Hunk' })
        map('v', '<leader>ghs', ':Gitsigns stage_hunk<CR>', { desc = '[S]tage Hunk' })
        map('n', '<leader>ghr', ':Gitsigns reset_hunk<CR>', { desc = '[R]eset Hunk' })
        map('v', '<leader>ghr', ':Gitsigns reset_hunk<CR>', { desc = '[R]eset Hunk' })
        map('n', '<leader>ghu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = '[U]nstage Hunk' })
        map('n', '<leader>ghp', '<cmd>Gitsigns preview_hunk<CR>', { desc = '[P]review Hunk' })
        map('n', '<leader>ghb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { desc = '[B]lame Line' })
        map('n', '<leader>ghd', '<cmd>Gitsigns diffthis<CR>', { desc = '[D]iff Index' })
        map('n', '<leader>ghD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', { desc = '[D]iff Last commit' })
        -- Buffer actions
        map('n', '<leader>gbs', '<cmd>Gitsigns stage_buffer<CR>', { desc = '[S]tage Buffer' })
        map('n', '<leader>gbr', '<cmd>Gitsigns reset_buffer<CR>', { desc = '[R]eset Buffer' })
        -- Toggle actions
        map('n', '<leader>gtb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = '[B]lame Toggle' })
        map('n', '<leader>gtd', '<cmd>Gitsigns toggle_deleted<CR>', { desc = '[D]eleted Lines Toggle' })

        --
        -- Text object
        -- Operator pending mode
        map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Hunk' })
        -- Delete mode
        map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select Hunk' })
      end,
    }
  end,
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
}
