return {
  'jamespeapen/Nvim-R',
  lazy = false,
  config = function()
    vim.g.R_auto_start = 0
    vim.g.R_openhtml = 0
    vim.g.R_user_maps_only = 1
    -- vim.g.R_csv_app = 'kitty -o font_size=12 -e bash /home/caiog/.scripts/tva'
    vim.g.R_csv_app = 'terminal:bash /home/caiog/.scripts/tva'
    vim.g.R_pdfviewer = 'zathura'
  end,
}
