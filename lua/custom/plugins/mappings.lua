return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
  config = function() -- This is the function that runs, AFTER loading
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>l'] = { name = '[L]sp', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = ' [S]pelling' },
      ['<leader>O'] = { desc = ' [O]rgmode' },
    }

    -- Kill search highlights
    vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = '[D]iagnostic' })
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

    -- Keybinds to make split navigation easier.
    --  Use CTRL+<hjkl> to switch between windows
    --
    --  See `:help wincmd` for a list of all window commands
    vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
    vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
    vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
    vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

    -- Save and close
    vim.keymap.set('n', '<leader>q', '<cmd>confirm quit<cr>', { desc = '[Q]uit' })
    vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite' })

    -- Spelling
    vim.keymap.set('n', '<leader>sp', '<cmd>setlocal spell spelllang=pt<cr>', { desc = 'Portuguese' })
    vim.keymap.set('n', '<leader>se', '<cmd>setlocal spell spelllang=en<cr>', { desc = 'English' })
    vim.keymap.set('n', '<leader>sgp', '<cmd>setlocal spell spelllang=pt,grc<cr>', { desc = 'Portuguese + Greek' })
    vim.keymap.set('n', '<leader>sge', '<cmd>setlocal spell spelllang=en,grc<cr>', { desc = 'English + Greek' })
    vim.keymap.set('n', '<leader>sq', '<cmd>setlocal nospell<cr>', { desc = 'Disable' })

    -- Neo-tree
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Neotree toggle' })
    vim.keymap.set('n', '<leader>o', '<cmd>Neotree action=show toggle<cr>', { desc = 'Neotree show' })

    -- LuaSnips

    vim.cmd [[
    " Use Tab to expand and jump through snippets
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

    " Use Shift-Tab to jump backwards through snippets
    imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    ]]

    if ft == 'tex' then
      require('which-key').register {
        ['<leader>T'] = { name = ' [T]ex', _ = 'which_key_ignore' },
      }

      vim.keymap.set('n', '<leader>Tv', '<cmd>VimtexView<cr>', { desc = 'View PDF' })
      vim.keymap.set('n', '<leader>TT', '<cmd>VimtexTocToggle<cr>', { desc = '[T]OC Toggle' })
      vim.keymap.set('n', '<leader>TC', '<cmd>VimtexClean<cr>', { desc = '[C]lean' })
    elseif ft == 'r' then
      require('which-key').register {
        ['<leader>r'] = { name = ' [R]lang', _ = 'which_key_ignore' },
      }

      -- TODO: Criar atalhos para o nvim-r
      vim.keymap.set('n', '<leader>rl', '<cmd>call SendLineToR("stay")<cr>', { desc = 'Send current line' })
      vim.keymap.set('n', '<leader>rsj', '<cmd>call SendLineToR("down")<cr>', { desc = 'Send line and jump' })
      vim.keymap.set('n', '<leader>rsm', '<cmd>set opfunc=SendMotionToR")<cr>g@', { desc = 'Send motion' })
      vim.keymap.set('n', '<leader>rkp', '<cmd>call RMakeRmd("pdf_document")<cr>')
      vim.keymap.set('n', '<leader>rkh', '<cmd>call RMakeRmd("html_document")<cr>')
    elseif ft == 'rust' then
      require('which-key').register {
        ['<leader>r'] = { name = ' [R]ust', _ = 'which_key_ignore' },
      }
      vim.keymap.set('n', '<leader>rb', '<cmd>:!cargo build<cr>', { desc = 'Build' })
      vim.keymap.set('n', '<leader>rc', '<cmd>:!cargo check<cr>', { desc = 'Check' })
      vim.keymap.set('n', '<leader>rC', '<cmd>:!cargo clippy<cr>', { desc = 'Clippy' })
      vim.keymap.set('n', '<leader>rt', '<cmd>:!cargo test<cr>', { desc = 'Test' })
      vim.keymap.set('n', '<leader>rr', '<cmd>:!cargo run<cr>', { desc = 'Run' })
    end
  end,
}
