-- for now colorscheme is choosen in plugins/colorschemes
vim.cmd([[
try
  colorscheme onedarker-giel
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

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
