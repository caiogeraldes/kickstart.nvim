return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'saadparwaiz1/cmp_luasnip',
    -- Adds other completion capabilities.
    --  nvim-cmp does not ship with all sources by default. They are split
    --  into multiple repos for maintenance purposes.
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    -- If you want to add a bunch of pre-configured snippets,
    --    you can use this plugin to help you. It even has snippets
    --    for various frameworks/libraries/etc. but you will have to
    --    set up the ones that are useful for you.
    'rafamadriz/friendly-snippets',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-emoji',
    'jc-doyle/cmp-pandoc-references',
    'kdheepak/cmp-latex-symbols',
    'chrisgrieser/cmp-nerdfont',
    'octaltree/cmp-look',
    'f3fora/cmp-spell',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      ---@diagnostic disable-next-line: undefined-field
      mapping = cmp.mapping.preset.insert {
        -- Select the [n]ext item
        ---@diagnostic disable-next-line: undefined-field
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ---@diagnostic disable-next-line: undefined-field
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        -- Accept ([y]es) the completion.
        --  This will auto-import if your LSP supports it.
        --  This will expand snippets if the LSP sent a snippet.
        ---@diagnostic disable-next-line: undefined-field
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ---@diagnostic disable-next-line: undefined-field
        ['<C-CR>'] = cmp.mapping.confirm { select = true },

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ---@diagnostic disable-next-line: undefined-field
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ---@diagnostic disable-next-line: undefined-field
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ---@diagnostic disable-next-line: undefined-field
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'friendly-snippets' },
        { name = 'nerdfont' },
        { name = 'pandoc_references' },
        { name = 'latex_symbols', filetype = 'tex' },
        { name = 'emoji' },
        { name = 'calc' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'orgmode', filetype = 'org' },
        { name = 'look' },
        {
          name = 'spell',
          filetype = 'tex',
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              return true
            end,
            preselect_correct_word = true,
          },
        },
      },
    }
  end,
}
