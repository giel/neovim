local opt = { noremap = true, silent = true }
-- local term_opts = { silent = true }
-- Shorten function name
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

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

-- LSP mapping see lsp.handlers
-- map('n', '[d', ':vim.lsp.diagnostic.goto_prev()<CR>')
-- map('n', ']d', ':vim.lsp.diagnostic.goto_next()<CR>')

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- https://github.com/folke/which-key.nvim
-- Using which-key to register some keymappings.
-- Only if succefully loaded, probably the second start after clean install.
local status_ok, wk = pcall(require, "which-key")
if status_ok then
  wk.register({
    ["<leader>"] = {
      f = {
        name = "+file Telescope" ,
        b = { ":Telescope buffers<CR>"    , "Buffers" }            ,
        f = { ":Telescope find_files<CR>" , "Find File" }          ,
        g = { ":Telescope live_grep<CR>"  , "Grep File" }          ,
        p = { ":Telescope projects<CR>"   , "Projects"}            ,
        n = { ":enew<CR>"                 , "New File" }           ,
      } ,

      b = {
        name = "+browse Telescope" ,
        g = { ":Telescope git_files<CR>"   , "Browse git files" }  ,
        h = { ":Telescope help_tags<CR>"   , "Help tags"}          ,
        m = { ":Telescope man_pages<CR>"   , "man pages" }         ,
      } ,
      l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { ":Telescope diagnostics<cr>", "Diagnostics" },
        i = { ":LspInfo<cr>", "Info" },
        I = { ":LspInstallInfo<cr>", "Installer Info" },
        j = { vim.diagnostic.goto_next, "Next Diagnostic", },
        k = { vim.diagnostic.goto_prev, "Prev Diagnostic", },
        l = { vim.lsp.codelens.run, "CodeLens Action" },
-- lunarvim routines
--        f = { require("lvim.lsp.utils").format, "Format" },
--        p = {
--          name = "Peek",
--          d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
--          t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
--          i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
--        },
        q = { vim.diagnostic.setloclist, "Quickfix" },
        r = { vim.lsp.buf.rename, "Rename" },
        s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
        e = { ":Telescope quickfix<cr>", "Telescope Quickfix" },
      },

      ["e"] = { ":NvimTreeToggle<CR>"      , "toggle tree" }                ,
      ["h"] = { ":set hlsearch!<CR>"       , "toggle search highlight" }    ,
      ["S"] = { ":w<CR>:source %<CR>"      , "save&source current buffer" } ,
      ["s"] = { ":w<CR>:luafile %<CR>"     , "save&luafile current buffer"} ,
      ["w"] = { ":set wrap!<CR>"           , "toggle word wrap" }           ,
      ["0"] = { ":set relativenumber!<CR>" , "toggle rel. line #" }         ,
      ["9"] = { ":set number!<CR>"         , "toggle line #" }              ,
      ["/"] = { ":CommentToggle<CR>"       , "toggle comment" }             ,
      ["?"] = { ":Cheatsheet<CR>"          , "cheat Sheet" }                ,
    } ,
  })
  local visualmappings={
    ["<leader>"] = {
      t = {
        name= "+tabularize" ,
        ["|"]  = { "<cmd>Tabularize/|/<CR>"   , " | " }    ,
        ["\\"] = { "<cmd>Tabularize/|/<CR>"   , " | " }    ,
        ["d"]  = { "<cmd>Tabularize/--/<CR>"  , " -- " }   ,
        ["="]  = { "<cmd>Tabularize/=/<CR>"   , " = " }    ,
        [","]  = { "<cmd>Tabularize/,/<CR>"   , " , " }    ,
      } ,

      ["/"] = { ":CommentToggle<CR>"         , "toggle comments" }       ,
    } ,
  }
  wk.register( visualmappings , { mode = "v" } )
end


-- does not work
-- vmappings = {
--       ["<"] = { "<gv", "shift text left" },
--       [">"] = { ">gv", "shift right" },
--     }
-- wk.register(vmappings, {mode = 'v'} )


