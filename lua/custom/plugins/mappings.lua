return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
  config = function() -- This is the function that runs, AFTER loading
    local r_mappings = function()
      require('which-key').register {
        ['<leader>r'] = { name = ' [R]lang', _ = 'which_key_ignore' },
        ['<leader>rc'] = { name = '󰧭 [C]hunk', _ = 'which_key_ignore' },
        ['<leader>rf'] = { name = ' [F]ile', _ = 'which_key_ignore' },
        ['<leader>rF'] = { name = '󰊕 [F]unction', _ = 'which_key_ignore' },
        ['<leader>rP'] = { name = ' [P]aragraph', _ = 'which_key_ignore' },
        ['<leader>rb'] = { name = '󰧭 [B]lock', _ = 'which_key_ignore' },
        ['<leader>rk'] = { name = '󰯊 [K]nit', _ = 'which_key_ignore' },
        ['<leader>rh'] = { name = '󰋖 [H]elp', _ = 'which_key_ignore' },
      }

      -- Open and close R
      vim.keymap.set('n', '<leader>rr', '<cmd>call StartR("R")<cr>', { desc = ' [R]un [R]' })
      vim.keymap.set('n', '<leader>rq', '<cmd>call StartR("R")<cr>', { desc = ' [Q]uit R' })

      -- Basic functionality
      -- Lines
      vim.keymap.set('n', '<leader>rl', '<cmd>call SendLineToR("stay")<cr>', { desc = 'Send current [L]ine' })
      vim.keymap.set('n', '<C-CR>', '<cmd>call SendLineToR("down")<cr>', { desc = 'Send current line' })
      vim.keymap.set('n', '<leader>ra', '<cmd>:call SendAboveLinesToR()<cr>', { desc = 'RSendAboveLines' })
      vim.keymap.set('n', '<leader>rL', '<cmd>:call SendLineToRAndInsertOutput()<cr>', { desc = 'RDSendLineAndInsertOutput' })
      -- Blocks
      vim.keymap.set('n', '<leader>rbb', '<cmd>:call SendMBlockToR("silent", "stay")<cr>', { desc = 'RSendMBlock' })
      vim.keymap.set('n', '<leader>rbe', '<cmd>:call SendMBlockToR("echo", "stay")<cr>', { desc = 'RESendMBlock' })
      vim.keymap.set('n', '<leader>rbd', '<cmd>:call SendMBlockToR("silent", "down")<cr>', { desc = 'RDSendMBlock' })
      vim.keymap.set('n', '<leader>rba', '<cmd>:call SendMBlockToR("echo", "down")<cr>', { desc = 'REDSendMBlock' })
      -- Paragraphs
      vim.keymap.set('n', '<leader>rPp', '<cmd>:call SendParagraphToR("silent", "stay")<cr>', { desc = 'RSendParagraph' })
      vim.keymap.set('n', '<leader>rPe', '<cmd>:call SendParagraphToR("echo", "stay")<cr>', { desc = 'RESendParagraph' })
      vim.keymap.set('n', '<leader>rPd', '<cmd>:call SendParagraphToR("silent", "down")<cr>', { desc = 'RDSendParagraph' })
      vim.keymap.set('n', '<leader>rPa', '<cmd>:call SendParagraphToR("echo", "down")<cr>', { desc = 'REDSendParagraph' })
      -- Files
      vim.keymap.set('n', '<leader>rfa', '<cmd>call SendFileToR("silent")<cr>', { desc = 'Silently send file' })
      vim.keymap.set('n', '<leader>rfe', '<cmd>call SendFileToR("echo")<cr>', { desc = 'Send file and [E]cho' })
      -- Functions
      vim.keymap.set('n', '<leader>rFf', '<cmd>:call SendFunctionToR("silent", "stay")<cr>', { desc = 'RSendFunction' })
      vim.keymap.set('n', '<leader>rFe', '<cmd>:call SendFunctionToR("echo", "stay")<cr>', { desc = 'RESendFunction' })
      vim.keymap.set('n', '<leader>rFd', '<cmd>:call SendFunctionToR("silent", "down")<cr>', { desc = 'RDSendFunction' })
      vim.keymap.set('n', '<leader>rFa', '<cmd>:call SendFunctionToR("echo", "down")<cr>', { desc = 'REDSendFunction' })

      -- Fast Functions
      vim.keymap.set('n', '<leader>rp', '<cmd>call RAction("plot")<cr>', { desc = '󰻉 [P]lot' })
      vim.keymap.set('n', '<leader>rd', '<cmd>call RAction("str")<cr>', { desc = ' [D]etailed structure' })
      vim.keymap.set('n', '<leader>rs', '<cmd>call RAction("summary")<cr>', { desc = ' [S]ummary' })
      vim.keymap.set('n', '<leader>ro', '<cmd>call RObjBrowser()<cr>', { desc = ' [O]bject Browser' })

      -- Help
      vim.keymap.set('n', '<leader>rha', '<cmd>call RAction("args")<cr>', { desc = 'Show [A]rguments' })
      vim.keymap.set('n', '<leader>rhh', '<cmd>call RAction("help")<cr>', { desc = 'Show [H]elp' })
      vim.keymap.set('n', '<leader>rhe', '<cmd>call RAction("example")<cr>', { desc = 'Show [E]xample' })

      -- Rmd
      vim.keymap.set('n', '<leader>rkp', '<cmd>call RMakeRmd("pdf_document")<cr>', { desc = '[P]DF' })
      vim.keymap.set('n', '<leader>rkh', '<cmd>call RMakeRmd("html_document")<cr>', { desc = '[H]tml' })
      vim.keymap.set('n', '<leader>rcc', '<cmd>call b:SendChunkToR("echo", "stay")<cr>', { desc = 'Send chunk and stay' })
      vim.keymap.set('n', '<leader>rca', '<cmd>call b:SendChunkToR("echo", "down")<cr>', { desc = 'Send chunk and jump to next' })
      vim.keymap.set('n', '<leader>rch', '<cmd>call SendFHChunkToR()<cr>', { desc = 'Send this and previous chunks' })
    end

    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>l'] = { name = '[L]sp', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = ' [S]pelling' },
      ['<leader>O'] = { desc = ' [O]rgmode' },
      ['<leader>g'] = { desc = ' [G]it' },
      ['<leader>gh'] = { desc = '󰘤 [H]unk' },
      ['<leader>gb'] = { desc = ' [B]uffer' },
      ['<leader>gt'] = { desc = ' [T]oggle' },
      ['<leader>u'] = { desc = '󰻐 [U]nicode' },
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
    vim.keymap.set('n', '<leader>c', '<cmd>bd<cr>', { desc = '[C]lose Buffer' })

    -- Spelling
    vim.keymap.set('n', '<leader>sp', '<cmd>setlocal spell spelllang=pt<cr>', { desc = 'Portuguese' })
    vim.keymap.set('n', '<leader>se', '<cmd>setlocal spell spelllang=en<cr>', { desc = 'English' })
    vim.keymap.set('n', '<leader>sgp', '<cmd>setlocal spell spelllang=pt,grc<cr>', { desc = 'Portuguese + Greek' })
    vim.keymap.set('n', '<leader>sge', '<cmd>setlocal spell spelllang=en,grc<cr>', { desc = 'English + Greek' })
    vim.keymap.set('n', '<leader>sq', '<cmd>setlocal nospell<cr>', { desc = 'Disable' })

    -- Symbols
    vim.keymap.set('n', '<leader>ua', '<cmd>Telescope symbols<cr>', { desc = '󰻐 [U]nicode Symbols [A]dd' })

    -- Neo-tree
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = 'Neotree toggle' })
    vim.keymap.set('n', '<leader>o', '<cmd>Neotree action=show toggle<cr>', { desc = 'Neotree show' })

    -- Gitsigns: see ./gitsigns.lua

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

      vim.keymap.set('n', '<leader>Tv', '<cmd>VimtexView<cr>', { desc = '  [V]iew PDF' })
      vim.keymap.set('n', '<leader>TT', '<cmd>VimtexTocToggle<cr>', { desc = '󰠶 [T]OC Toggle' })
      vim.keymap.set('n', '<leader>TC', '<cmd>VimtexClean<cr>', { desc = '󰃢 [C]lean' })
    elseif ft == 'r' then
      r_mappings()
    elseif ft == 'rmd' then
      r_mappings()
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
