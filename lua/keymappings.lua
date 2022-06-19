local opt = { noremap = true, silent = true }
-- local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- quit and quit all
-- map('n', '<Leader>q'   , ':q<CR>')
-- map('n', '<Leader>qa'  , ':qall<CR>')
-- map('n', '<Leader>qaz' , ':qall!<CR>')

-- buffers (and bufferline) actions
map('n', '<leader>,', ':bfirst<CR>')    -- got firts buffer
map('n', '<leader>.', ':blast<CR>')     -- goto last buffer
map('n', '<leader>c', ':Bdelete<CR>')   -- close buffer
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt)  -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab
-- Tab to switch buffers in Normal mode
--map("n", "<Tab>", ":bnext<CR>")
--map("n", "<S-Tab>", ":bprevious<CR>")

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]])
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]])
map("n", "bp",  ":BufferLinePick<CR>")        -- choose tab letter to activate
map("n", "bcl",  ":BufferLineCloseLeft<CR>")  -- close all buffers to the left
map("n", "bcr",  ":BufferLineCloseRight<CR>") -- close all buffers to the right

-- disable Up & Down arrows in insert mode to promote to go to Normal mode ;)
map('i' , '<Up>'    , '<NOP>')
map('i' , '<Down>'  , '<NOP>')

-- better window movement
map('n', '<C-h>'     , '<C-w>h') -- goto window left
map('n', '<C-j>'     , '<C-w>j')
map('n', '<C-k>'     , '<C-w>k')
map('n', '<C-l>'     , '<C-w>l')
map('n', '<C-Left>'  , '<C-w>h')
map('n', '<C-Down>'  , '<C-w>j')
map('n', '<C-Up>'    , '<C-w>k')
map('n', '<C-Right>' , '<C-w>l')
map('n', '<F4>'      , '<C-w>q') -- close window

-- resize windows with arrows
map('n' , '<C-S-Up>'    , ':resize -2<CR>')
map('n' , '<C-S-Down>'  , ':resize +2<CR>')
map('n' , '<C-S-Left>'  , ':vertical resize -2<CR>')
map('n' , '<C-S-Right>' , ':vertical resize +2<CR>')


-- In insert mode jk or kj is escape !
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')

-- Move selected line / block of text in visual mode
map('x', 'K', ':move \'<-2<CR>gv-gv')
map('x', 'J', ':move \'>+1<CR>gv-gv')

-- Telescope
map('n', '<leader>fh', ':Telescope help_tags<cr>')
--vim.api.nvim_set_keymap('n', '<leader>pp', ':Telescope planets<cr>', {noremap = true, silent=true})


-- Better nav for omnicomplete
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- https://github.com/folke/which-key.nvim
-- Using which-key to register some keymappings.
-- Only if succefully loaded, probably the second start after clean install.
local status_ok, wk = pcall(require, "which-key")
if status_ok then
  wk.register({
    ["<leader>"] = {
      f = {
        name = "+file" ,
        b = { "<cmd>Telescope buffers<cr>"    , "Buffers" }            ,
        f = { "<cmd>Telescope find_files<cr>" , "Find File" }          ,
        g = { "<cmd>Telescope live_grep<cr>"  , "Grep File" }          ,
        h = { ":Telescope help_tags<cr>"      , "Telescope help tags"} ,
        r = { "<cmd>Telescope oldfiles<cr>"   , "Open Recent File" }   ,
        n = { "<cmd>enew<cr>"                 , "New File" }           ,
      } ,
      b = {
        name = "+browse" ,
        f = { "<cmd>Telescope file_browser<CR>" , "Browse Files" }               ,
        g = { "<cmd>Telescope git_files<CR>"    , "Browse git files" }           ,
      } ,
      ["e"] = { "<cmd>NvimTreeToggle<CR>"       , "toggle tree" }                ,
      ["h"] = { "<cmd>set hlsearch!<CR>"        , "toggle search highlight" }    ,
      ["s"] = { "<cmd>w<CR><cmd>source %<CR>"   , "save&source current buffer" } ,
      ["l"] = { "<cmd>w<CR><cmd>luafile %<CR>"  , "save&luafile current buffer"} ,
      ["w"] = { "<cmd>set wrap!<CR>"            , "toggle word wrap" }           ,
      ["0"] = { "<cmd>set relativenumber!<CR>"  , "toggle rel. line #" }         ,
      ["9"] = { "<cmd>set number!<CR>"          , "toggle line #" }              ,
      ["/"] = { "<cmd>CommentToggle<CR>"        , "toggle comment" }             ,
      ["?"] = { "<cmd>Cheatsheet<CR>"           , "cheat Sheet" }                ,
    } ,
  })
  local visualmappings={
    ["<leader>"] = {
      t = {
        name= "+tabularize"                   ,
        ["|"]  = { "<cmd>Tabularize/|/<CR>"   , " | " }    ,
        ["\\"] = { "<cmd>Tabularize/|/<CR>"   , " | " }    ,
        ["d"]  = { "<cmd>Tabularize/--/<CR>"  , " -- " }   ,
        ["="]  = { "<cmd>Tabularize/=/<CR>"   , " = " }    ,
        [","]  = { "<cmd>Tabularize/ , /<CR>" , " , " }    ,
      }                                      ,
      ["/"] = { ":CommentToggle<CR>"         , "toggle comments" }       ,
    }                                        ,
  }
  wk.register( visualmappings , { mode = "v" } )
end


-- does not work
-- vmappings = {
--       ["<"] = { "<gv", "shift text left" },
--       [">"] = { ">gv", "shift right" },
--     }
-- wk.register(vmappings, {mode = 'v'} )

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

