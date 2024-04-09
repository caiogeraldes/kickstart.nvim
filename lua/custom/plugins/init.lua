-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  { 'chrisgrieser/cmp-nerdfont', lazy = false },
  'rust-lang/rust.vim',
  'simrat39/rust-tools.nvim',
  'tpope/vim-repeat',
  'lervag/vimtex',
  { 'sainnhe/gruvbox-material' },
  'eigenfoo/stan-vim',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-emoji',
  'f3fora/cmp-spell',
  'ray-x/cmp-treesitter',
  'kdheepak/cmp-latex-symbols',
  'jc-doyle/cmp-pandoc-references',
  'gpanders/nvim-parinfer',
  'onsails/lspkind-nvim',
  'eigenfoo/stan-vim',
  'HiPhish/rainbow-delimiters.nvim',
  'nvim-neotest/nvim-nio',
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
