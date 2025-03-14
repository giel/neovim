-- stylua: ignore start
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 0                           -- normal space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone","noinsert", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.showmode = false                        -- mode already shown in lualine
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeout = true                          -- use timeoutlen? (default true)
vim.opt.timeoutlen = 1000                       -- time in ms to wait for a key code sequence to complete. (default 1000)
-- vim.opt.ttimeout = true                         -- TUI: use ttimeoutlen? (default true)
-- vim.opt.ttimeoutlen = 800                       -- TUI: Time in ms to wait for a key code sequence to complete. (default 50)
vim.opt.undofile = true                         -- enable persistent undo
-- vim.opt.updatetime = 250                     -- wait time for writing swap file (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line

-- Set cursor shape in normal mode to vertical bar,and in insert mode to horizontal line
-- vim.opt.guicursor= 'n-v-c:ver5,i-ci:hor20-Cursor/lCursor'

vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.o.spell = false                             -- start with spell check off
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.linebreak = true                        -- do nice line breaks
vim.opt.scrolloff = 8                           -- start scrolling 8 lines from bottom or top
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append("c")                   -- don't show redundant messages from ins-completion-menu
vim.opt.whichwrap:append("<,>,[,],h,l")         -- move to next line with theses keys
vim.opt.iskeyword:append("-")                   -- Treat dash separated words as a word text object"
vim.opt.virtualedit = "block"                   -- allow cursor placement where there is no character (only block mode)
vim.opt.lazyredraw = true                       -- don't bother updating screen during macro playback
vim.opt.encoding = "UTF-8"
vim.opt.listchars = { tab = ">-", trail = ".", eol = "$" }
-- stylua: ignore end
-------------------------------------------------------------------------------
-- https://github.com/nanotee/nvim-lua-guide#using-meta-accessors
-- vim.o:  behaves like :set
-- vim.go: behaves like :setglobal
-- vim.bo: behaves like :setlocal for buffer-local options
-- vim.wo: behaves like :setlocal for window-local options

-- Use telescope or fzf. One of the two is activated.
UseTelescope = false
-- UseTelescope = true

-- Disable provider (and warning):
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
