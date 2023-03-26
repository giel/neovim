local opt = { noremap = true, silent = true }

--Leader key already defined in Lazy

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
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
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]])
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]])
map("n", "bp", ":BufferLinePick<CR>") -- choose tab letter to activate
map("n", "bcl", ":BufferLineCloseLeft<CR>") -- close all buffers to the left
map("n", "bcr", ":BufferLineCloseRight<CR>") -- close all buffers to the right

-- disable Up & Down arrows in insert mode to promote to go to Normal mode ;)
map("i", "<Up>", "<NOP>")
map("i", "<Down>", "<NOP>")

-- better window movement
map("n", "<C-h>", "<C-w>h") -- goto window left
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-Left>", "<C-w>h")
map("n", "<C-Down>", "<C-w>j")
map("n", "<C-Up>", "<C-w>k")
map("n", "<C-Right>", "<C-w>l")
map("n", "<F4>", "<C-w>q") -- close window

-- resize windows with arrows
map("n", "<C-S-Up>", ":resize -2<CR>")
map("n", "<C-S-Down>", ":resize +2<CR>")
map("n", "<C-S-Left>", ":vertical resize -2<CR>")
map("n", "<C-S-Right>", ":vertical resize +2<CR>")

-- In insert mode jk or kj is escape !
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Illuminate plugin (higlights same words as cursor is on)
-- map('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>')
-- map('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>')
-- vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})

-- https://github.com/folke/which-key.nvim
-- Using which-key to register some keymappings.
-- Only if succefully loaded, probably the second start after clean install.
local status_ok, wk = pcall(require, "which-key")
if status_ok then
  wk.register({
    ["<leader>"] = {
      f = {
        name = "+file Telescope",
        b = { ":Telescope buffers<CR>", "Buffers" },
        f = { ":Telescope find_files<CR>", "Find File" },
        g = { ":Telescope live_grep<CR>", "Grep File" },
        p = { ":Telescope projects<CR>", "Projects" },
        n = { ":enew<CR>", "New File" },
      },

      b = {
        name = "+browse Telescope",
        g = { ":Telescope git_files<CR>", "Browse git files" },
        h = { ":Telescope help_tags<CR>", "Help tags" },
        m = { ":Telescope man_pages<CR>", "man pages" },
      },
      l = {
        -- LSP mapping see also lsp.handlers
        name = "LSP",
        d = { ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { ":Telescope diagnostics<cr>", "Diagnostics" },
        q = { vim.diagnostic.setloclist, "Quickfix" },
        r = { vim.lsp.buf.rename, "Rename" },
        s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        e = { ":Telescope quickfix<cr>", "Telescope Quickfix" },
      },
      -- lunarvim routines
      --        f = { require("lvim.lsp.utils").format, "Format" },
      --        p = {
      --          name = "Peek",
      --          d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
      --          t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
      --          i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
      --        },

      [","] = { ":bfirst<CR>", "go to first buffer" },
      ["."] = { ":blast<CR>", "go to last buffer" },
      ["a"] = { ":Alpha<CR>", "alpha start menu" },
      ["c"] = { ":Bdelete<CR>", "close buffer" },
      ["e"] = { ":Neotree toggle<CR>", "toggle tree" },
      -- ["e"] = { ":NvimTreeToggle<CR>"      , "toggle tree" }                ,
      ["h"] = { ":set hlsearch!<CR>", "toggle search highlight" },
      ["S"] = { ":w<CR>:source %<CR>", "save&source current buffer" },
      ["s"] = { ":w<CR>:luafile %<CR>", "save&luafile current buffer" },
      ["w"] = { ":set wrap!<CR>", "toggle word wrap" },
      ["0"] = { ":set relativenumber!<CR>", "toggle rel. line #" },
      ["9"] = { ":set number!<CR>", "toggle line #" },
      ["/"] = { ":CommentToggle<CR>", "toggle comment" },
      ["?"] = { ":Cheatsheet<CR>", "cheat Sheet" },
    },
  })
  local visualmappings = {
    ["<leader>"] = {
      t = {
        name = "+tabularize",
        ["|"] = { "<cmd>Tabularize/|/<CR>", " | " },
        ["\\"] = { "<cmd>Tabularize/|/<CR>", " | " },
        ["d"] = { "<cmd>Tabularize/--/<CR>", " -- " },
        ["="] = { "<cmd>Tabularize/=/<CR>", " = " },
        [","] = { "<cmd>Tabularize/,/<CR>", " , " },
      },

      ["/"] = { ":CommentToggle<CR>", "toggle comments" },
    },
  }
  wk.register(visualmappings, { mode = "v" })
end

-- URL handling, source https://sbulav.github.io/vim/neovim-opening-urls/
if vim.fn.has("mac") == 1 then
  map("", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>')
elseif vim.fn.has("unix") == 1 then
  map("", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')
else
  map("", "gx", '<Cmd>lua print("Error: gx is not supported on this OS!")<CR>')
end

-- does not work
-- vmappings = {
--       ["<"] = { "<gv", "shift text left" },
--       [">"] = { ">gv", "shift right" },
--     }
-- wk.register(vmappings, {mode = 'v'} )
