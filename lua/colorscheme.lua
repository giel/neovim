vim.cmd([[
try
  colorscheme onedarker-giel
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

local C = require("onedarker-giel.palette")
vim.api.nvim_set_hl(0, "WinSeparator", { bg = C.bg })

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
