-- General mappings
require('settings')
require('plugins')
require('colorscheme')
require "autocommands"
require('keymappings')       -- Keymappings for last to allow for mapping of plugins ?

-- Plugins specific inits
require('init.bufferline')   -- tabs for buffers
require('init.cheatsheet')   -- cheat sheet
require('init.cmp')          -- completion plugin
require('init.colorizer')    -- show colors of hex values
require('init.gitsigns')     -- git changes in gutter
require('init.illuminate')   -- highlight word under cursor
require('init.lualine')      -- status line
require('init.nvim-comment') -- commenting lines
require('init.nvim-tree')    -- treeview of files
require('init.project')      -- project detection
require('init.telescope')    -- highly extendable fuzzy finder over lists
require('init.which-key')    -- cheetsheet for keybindings
require('lsp')               -- global lsp install

