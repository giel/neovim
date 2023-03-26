vim.cmd([[
try
  colorscheme onedarker-giel
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

-- TODO use a background of the colorscheme, or even change colorscheme
vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#282c34" })

-- colorscheme blue
-- colorscheme codedark
-- colorscheme darkplus
-- colorscheme default
-- colorscheme dracula
-- colorscheme molokai
-- colorscheme nord
-- colorscheme one
-- colorscheme onedark
-- colorscheme papercolor
-- colorscheme solarized
-- colorscheme vim-one
