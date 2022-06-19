vim.cmd [[
try
  colorscheme onedarker-giel
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]


--vim.o.background = "light" -- dark or light
-- vim.o.background = "dark"  -- dark or light

-- vim.cmd('colorscheme blue')
-- vim.cmd('colorscheme default')
-- vim.cmd('colorscheme dracula')
-- vim.cmd('colorscheme codedark')
-- vim.cmd('colorscheme papercolor')
-- vim.cmd('colorscheme molokai')
-- vim.cmd('colorscheme nord')
--vim.cmd('colorscheme one')
--vim.cmd('colorscheme darkplus')
-- call one#highlight('vimLineComment', 'cccccc', '', 'none')
-- vim.fn["one#highlight"]('vimLineComment','cccc00', '', 'none')
--
-- colortest: foreground #000000
--            backgroud  #00e0ff
-- vim.fn["one#highlight"]('CursorLine','000000', '00e0ff', 'none')
--vim.fn["one#highlight"]('CursorLine','000000', '00d0f0', 'none')
-- vim.cmd('colorscheme onedark')
-- vim.cmd('colorscheme solarized')
-- vim.cmd('colorscheme vim-one')

