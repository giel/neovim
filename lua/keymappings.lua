local opt = { noremap = true, silent = true }

--Leader key already defined in Lazy

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  -- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  vim.keymap.set(mode, lhs, rhs, options)
end

-- quit and quit all
-- map('n', '<Leader>q'   , ':q<CR>')
-- map('n', '<Leader>qa'  , ':qall<CR>')
-- map('n', '<Leader>qaz' , ':qall!<CR>')

-- buffers (and bufferline) actions
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Bufferline" })
map("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Bufferline" })
map("n", "bp", ":BufferLinePick<CR>") -- choose tab letter to activate
map("n", "bcl", ":BufferLineCloseLeft<CR>") -- close all buffers to the left
map("n", "bcr", ":BufferLineCloseRight<CR>") -- close all buffers to the right

-- disable Up & Down arrows in insert mode to promote to go to Normal mode ;)
map("i", "<Up>", "<NOP>")
map("i", "<Down>", "<NOP>")

-- better window movement
-- map("n", "<C-Left>", "<C-w>h", { desc = "Goto window left" })
-- map("n", "<C-Right>", "<C-w>l", { desc = "Goto window right" })
-- map("n", "<C-Up>", "<C-w>k", { desc = "Goto window up" })
-- map("n", "<C-Down>", "<C-w>j", { desc = "Goto window down" })
map("n", "<C-h>", "<C-w>h", { desc = "Goto window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Goto window right" })
map("n", "<C-k>", "<C-w>k", { desc = "Goto window up" })
map("n", "<C-j>", "<C-w>j", { desc = "Goto window down" })

-- resize windows
-- map("n", "<C-j>", ":resize -2<CR>")
-- map("n", "<C-k>", ":resize +2<CR>")
-- map("n", "<C-h>", ":vertical resize -2<CR>")
-- map("n", "<C-l>", ":vertical resize +2<CR>")
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- In insert mode jk or kj is escape !
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- file buffer commands
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- next clashes with built in window commands.
-- map({ "i", "v", "n", "s" }, "<C-w>", "<cmd>bdelete<cr><esc>", { desc = "Close file" })
map("n", "<C-n>", "<cmd>enew<cr>", { desc = "New File" })

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
      b = {
        name = "+browse Telescope",
        g = { ":Telescope git_files<CR>", "Browse git files" },
        h = { ":Telescope help_tags<CR>", "Help tags" },
        m = { ":Telescope man_pages<CR>", "man pages" },
      },
      -- see also in keymaps.lua in LSP
      c = {
        name = "+code related",
      },
      f = {
        name = "+file Telescope",
        b = { ":Telescope buffers<CR>", "Buffers" },
        f = { ":Telescope find_files<CR>", "Find File" },
        g = { ":Telescope live_grep<CR>", "Grep File" },
        p = { ":Telescope projects<CR>", "Projects" },
        n = { ":enew<CR>", "New File" },
      },
      g = {
        name = "+goto related",
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
      t = {
        name = "Text/view options",
        ["s"] = { ":set spell!<CR>", "toggle spell check" },
        ["w"] = { ":set wrap!<CR>", "toggle word wrap" },
        ["0"] = { ":set relativenumber!<CR>", "toggle rel. line #" },
        ["9"] = { ":set number!<CR>", "toggle line #" },
      },
      [","] = { ":bfirst<CR>", "go to first buffer" },
      ["."] = { ":blast<CR>", "go to last buffer" },
      ["x"] = { ":bdelete<CR>", "delete (close) buffer" },
      ["a"] = { ":Alpha<CR>", "alpha start menu" },
      ["e"] = { ":Neotree toggle<CR>", "toggle tree" },
      -- ["e"] = { ":NvimTreeToggle<CR>"      , "toggle tree" }                ,
      ["h"] = { ":set hlsearch!<CR>", "toggle search highlight" },
      ["S"] = { ":w<CR>:source %<CR>", "save&source current buffer" },
      ["s"] = { ":w<CR>:luafile %<CR>", "save&luafile current buffer" },
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
