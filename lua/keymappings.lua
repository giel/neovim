--Leader key already defined in Lazy

-- for map command:
require("utils")
-- quit and quit all
-- map('n', '<Leader>q'   , ':q<CR>')
-- map('n', '<Leader>qa'  , ':qall<CR>')
-- map('n', '<Leader>qaz' , ':qall!<CR>')

-- ESC to turn off highlighted text
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- for mini.surround turn of pressing 's' to delete character under cursor
--- Note: if 'timeoutlen' is low enough to cause occasional usage of |s| key
--- (that deletes character under cursor), disable it with the following:
map({ "n", "x" }, "s", "<Nop>")

-- disable Up & Down arrows in insert mode to promote to go to Normal mode ;)
map("i", "<Up>", "<NOP>")
map("i", "<Down>", "<NOP>")
-- even disable ALL arrow keys in normal mode
-- map("n", "<Up>", "<NOP>")
-- map("n", "<Down>", "<NOP>")
-- map("n", "<Left>", "<NOP>")
-- map("n", "<Right>", "<NOP>")

-- better window movement/resizing (also check compatibility with terminal emulator)
-- window movement and resize with arrow keys
map("n", "<C-Left>", "<C-w>h", { desc = "Goto window left" })
map("n", "<C-Right>", "<C-w>l", { desc = "Goto window right" })
map("n", "<C-Up>", "<C-w>k", { desc = "Goto window up" })
map("n", "<C-Down>", "<C-w>j", { desc = "Goto window down" })
map("n", "<C-S-Up>", ":resize +2<CR>")
map("n", "<C-S-Down>", ":resize -2<CR>")
map("n", "<C-S-Left>", ":vertical resize -2<CR>")
map("n", "<C-S-Right>", ":vertical resize +2<CR>")
-- window movement and resize with vim keys
map("n", "<C-h>", "<C-w>h", { desc = "Goto window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Goto window right" })
map("n", "<C-k>", "<C-w>k", { desc = "Goto window up" })
map("n", "<C-j>", "<C-w>j", { desc = "Goto window down" })
-- splits functions
map("n", "<F5>", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<F6>", ":vsplit<CR>", { desc = "Split window vertically" })
-- map("n", "<Esc>[15;2~", function() -- Shift-F5
map("n", "<F7>", function()
  vim.cmd("wincmd K")
end, { desc = "Move split to horizontal layout" })
-- map("n", "<Esc>[1;2Q", function() -- Shift-F6
map("n", "<F8>", function()
  vim.cmd("wincmd H")
end, { desc = "Move split to vertical layout" })
-- Move Lines (does not seem to work om MacOS in Alacritty)
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Oil keybindings
-- Open parent directory in current window
map("n", "-", "<cmd>Oil<cr>", { desc = "Oil: Open parent dir" })
-- Open parent directory in floating window
map("n", "<space>-", require("oil").toggle_float, { desc = "Oil: Open parent dir floating" })

-- Better indenting
map("v", "<", "<gv", { desc = "Move to left" })
map("v", ">", ">gv", { desc = "Move to right" })

-- copilot keybindings
-- map("i", "<C-S-Y>", "<Plug>(copilot-accept-word)", { desc = "Accepts word of copilot suggestion" })
map("i", "<C-Y>", "<Plug>(copilot-accept-word)", { desc = "Copilot: Accepts word suggestion" })
map("i", "<C-S-Y>", "<Plug>(copilot-accept-line)", { desc = "Copilot: Accepts line suggestion" })
map("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Copilot: Next suggestion" })
map("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Copilot: Previous suggestion" })
-- map("i", "<C-Y>", 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false,
--   desc = "Accepts whole copilot suggestion",
-- })
-- vim.g.copilot_no_tab_map = true

-- file buffer commands
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- next clashes with built in window commands.
-- map({ "i", "v", "n", "s" }, "<C-w>", "<cmd>bdelete<cr><esc>", { desc = "Close file" })

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
  wk.add({
    { "<leader>,", ":bprevious<CR>", desc = "previous buffer" },
    { "<leader>.", ":bnext<CR>", desc = "next buffer" },
    { "<leader>/", ":CommentToggle<CR>", desc = "toggle comment" },
    { "<leader><", ":bfirst<CR>", desc = "go to first buffer" },
    { "<leader>>", ":blast<CR>", desc = "go to last buffer" },
    { "<leader>?", ":Cheatsheet<CR>", desc = "Cheat Sheet" },
    { "<leader>a", ":Alpha<CR>", desc = "Alpha start menu" },
    { "<leader>e", ":Neotree toggle<cr>", desc = "NeoTree" },
    { "<leader>x", ":Bdelete<CR>", desc = "delete (close) buffer" },

    { "<leader>b", group = "browse Telescope" },

    { "<leader>c", group = "code related" },
    { "<leader>cS", ":w<CR>:source %<CR>", desc = "save&source current buffer" },
    { "<leader>c_", hidden = true },
    { "<leader>cp", ":Copilot panel<CR>", desc = "Copilot panel" },
    { "<leader>cs", ":w<CR>:luafile %<CR>", desc = "save&luafile current buffer" },

    { "<leader>f", group = "file search/find" },
    { "<leader>fn", ":enew<CR>", desc = "New File" },

    { "<leader>g", group = "git related" },
    { "<leader>i", group = "increment selection related" },

    { "<leader>l", group = "LSP" },
    { "<leader>lq", vim.diagnostic.setloclist, desc = "Quickfix" },
    { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },

    { "<leader>o", group = "Obsidian options" },
    { "<leader>on", ":ObsidianNew<CR>", desc = "Obsidion: New document" },
    { "<leader>oo", ":ObsidianOpen<CR>", desc = "Obsidion: Open buffer" },
    { "<leader>ow", ":ObsidianWorkspace<CR>", desc = "Obsidion: workspace" },

    { "<leader>s", group = "Search options" },
    -- {
    --   "<leader>sp",
    --   ":lua require('spectre').open_file_search({select_word=true})<CR>",
    --   desc = "Search word in current file",
    -- },
    -- { "<leader>ss", ":lua require('spectre').open()<CR>", desc = "Search/Replace in files" },
    -- { "<leader>sw", ":lua require('spectre').open_visual({select_word=true})<CR>", desc = "Search current word" },

    {
      "<leader>sp",
      function()
        require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
      end,
      desc = "Search word in current file",
    },
    { "<leader>ss", ":GrugFar<CR>", desc = "Search/Replace in files" },
    {
      "<leader>sw",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Search current word",
    },

    { "<leader>t", group = "tabs/buffers actions" },
    { "<leader>tl", ":BufferLineCloseLeft<CR>", desc = "close all buffers to the left" },
    { "<leader>tn", ":tabnew<CR>", desc = "new tab" },
    { "<leader>to", ":BufferLineCloseOthers<CR>", desc = "close other buffers" },
    { "<leader>tp", ":BufferLinePick<CR>", desc = "choose tab letter to activate" },
    { "<leader>tr", ":BufferLineCloseRight<CR>", desc = "close all buffers to the right" },
    { "<leader>tw", ":Bdelete<CR>", desc = "close tab" },

    { "<leader>v", group = "Text/view options" },
    { "<leader>v0", ":set relativenumber!<CR>", desc = "toggle rel. line #" },
    { "<leader>v9", ":set number!<CR>", desc = "toggle line #" },
    { "<leader>vs", ":set spell!<CR>", desc = "toggle spell check" },
    { "<leader>vv", ":set list!<CR>", desc = "toggle invisible chars" },
    { "<leader>vw", ":set wrap!<CR>", desc = "toggle word wrap" },

    {
      mode = { "v" },
      { "<leader>/", ":CommentToggle<CR>", desc = "toggle comments" },

      -- { "<leader>s", group = "Search options" },
      -- { "<leader>sw", ":lua require('spectre').open_visual()<CR>", desc = "Search current word (spectre)" },

      { "<leader>t", group = "tabularize" },
      { "<leader>t,", "<cmd>Tabularize/,/<CR>", desc = " , " },
      { "<leader>t:", "<cmd>Tabularize/:/<CR>", desc = " : " },
      { "<leader>t=", "<cmd>Tabularize/=/<CR>", desc = " = " },
      { "<leader>t\\", "<cmd>Tabularize/|/<CR>", desc = " | " },
      { "<leader>td", "<cmd>Tabularize/--/<CR>", desc = " -- " },
      { "<leader>t|", "<cmd>Tabularize/|/<CR>", desc = " | " },
    },
  })
end
