return {
  'xvzc/skeleton.nvim',
  config = function()
    require('skeleton').setup {
      template_path = vim.fn.stdpath 'config' .. '/templates',
      patterns = {
        tex = { '*.tex' },
      },
      tags = {
        author = 'Caio Geraldes',
        email = 'caio.geraldes@usp.br',
        bibliopath = '~/proj/biblio/biblio.bib',
      },
    }
  end,
}
