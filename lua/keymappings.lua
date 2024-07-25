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

-- ESC to turn off highlighted text
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- disable Up & Down arrows in insert mode to promote to go to Normal mode ;)
map("i", "<Up>", "<NOP>")
map("i", "<Down>", "<NOP>")
-- even disable ALL arrow keys in normal mode
-- map("n", "<Up>", "<NOP>")
-- map("n", "<Down>", "<NOP>")
-- map("n", "<Left>", "<NOP>")
-- map("n", "<Right>", "<NOP>")

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
-- -- with shift interferes with wezterm
-- -- map("n", "<C-S-j>", ":resize -2<CR>")
-- -- map("n", "<C-S-k>", ":resize +2<CR>")
-- -- map("n", "<C-S-h>", ":vertical resize -2<CR>")
-- -- map("n", "<C-S-l>", ":vertical resize +2<CR>")
-- -- so use ctrl-arrows for resize
-- map("n", "<C-Up>", ":resize +2<CR>")
-- map("n", "<C-Down>", ":resize -2<CR>")
-- map("n", "<C-Left>", ":vertical resize -2<CR>")
-- map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move Lines (does not seem to work om MacOS in Alacritty)
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Better indenting
map("v", "<", "<gv", { desc = "Move to left" })
map("v", ">", ">gv", { desc = "Move to right" })

-- copilot keybindings
-- map("i", "<C-S-Y>", "<Plug>(copilot-accept-word)", { desc = "Accepts word of copilot suggestion" })
map("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next copilot suggestion" })
map("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Previous copilot suggestion" })
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
    { "<leader>?", ":Cheatsheet<CR>", desc = "cheat Sheet" },
    { "<leader>a", ":Alpha<CR>", desc = "alpha start menu" },

    { "<leader>b", group = "browse Telescope" },
    { "<leader>bg", ":Telescope git_files<CR>", desc = "Browse git files" },
    { "<leader>bh", ":Telescope help_tags<CR>", desc = "Help tags" },
    { "<leader>bm", ":Telescope man_pages<CR>", desc = "man pages" },

    { "<leader>c", group = "code related" },
    { "<leader>cS", ":w<CR>:source %<CR>", desc = "save&source current buffer" },
    { "<leader>cT", ":TrimToggle<CR>", desc = "Toggle trim on save" },
    { "<leader>c_", hidden = true },
    { "<leader>cp", ":Copilot panel<CR>", desc = "Copilot panel" },
    { "<leader>cs", ":w<CR>:luafile %<CR>", desc = "save&luafile current buffer" },
    { "<leader>ct", ":Trim<CR>", desc = "remove trailing space" },
    { "<leader>e", ":Neotree toggle<cr>", desc = "NeoTree" },

    { "<leader>f", group = "file Telescope" },
    { "<leader>fb", ":Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>ff", ":Telescope find_files<CR>", desc = "Find File" },
    { "<leader>fg", ":Telescope live_grep<CR>", desc = "Grep File" },
    { "<leader>fn", ":enew<CR>", desc = "New File" },
    { "<leader>fp", ":Telescope projects<CR>", desc = "Projects" },
    { "<leader>fr", ":Telescope oldfiles <CR>", desc = "Recent files " },
    {
      "<leader>fw",
      ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<CR>",
      desc = "Grep fileword under cursor",
    },

    { "<leader>g", group = "goto related" },
    { "<leader>h", ":set hlsearch!<CR>", desc = "toggle search highlight" },
    { "<leader>i", group = "increment selection related" },

    { "<leader>l", group = "LSP" },
    { "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>ld", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
    { "<leader>le", ":Telescope quickfix<cr>", desc = "Telescope Quickfix" },
    --       q = { vim.diagnostic.setloclist, "Quickfix" },
    --       r = { vim.lsp.buf.rename, "Rename" },
    -- { "<leader>lq", <function 1>, desc = "Quickfix" },
    -- { "<leader>lr", <function 1>, desc = "Rename" },
    { "<leader>ls", ":Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>lw", ":Telescope diagnostics<cr>", desc = "Diagnostics" },

    { "<leader>o", group = "Obsidian options" },
    { "<leader>on", ":ObsidianNew<CR>", desc = "New Obsidion document" },
    { "<leader>oo", ":ObsidianOpen<CR>", desc = "Open buffer in Obsidian" },
    { "<leader>ow", ":ObsidianWorkspace<CR>", desc = "Obsidion workspace" },

    { "<leader>s", group = "Search options (spectre)" },
    {
      "<leader>sp",
      ":lua require('spectre').open_file_search({select_word=true})<CR>",
      desc = "Search word in current file",
    },
    { "<leader>ss", ":lua require('spectre').open()<CR>", desc = "Search/Replace in files" },
    { "<leader>sw", ":lua require('spectre').open_visual({select_word=true})<CR>", desc = "Search current word" },

    { "<leader>t", group = "tabs/buffers actions" },
    { "<leader>tl", ":BufferLineCloseLeft<CR>", desc = "close all buffers to the left" },
    { "<leader>tn", ":tabnew<CR>", desc = "new tab" },
    { "<leader>to", ":BufferLineCloseOthers<CR>", desc = "close other buffers" },
    { "<leader>tp", ":BufferLinePick<CR>", desc = "choose tab letter to activate" },
    { "<leader>tr", ":BufferLineCloseRight<CR>", desc = "close all buffers to the right" },
    { "<leader>tx", ":Bdelete<CR>", desc = "close tab" },

    { "<leader>v", group = "Text/view options" },
    { "<leader>v0", ":set relativenumber!<CR>", desc = "toggle rel. line #" },
    { "<leader>v9", ":set number!<CR>", desc = "toggle line #" },
    { "<leader>vs", ":set spell!<CR>", desc = "toggle spell check" },
    { "<leader>vw", ":set wrap!<CR>", desc = "toggle word wrap" },
    { "<leader>x", ":Bdelete<CR>", desc = "delete (close) buffer" },

    {
      mode = { "v" },
      { "<leader>/", ":CommentToggle<CR>", desc = "toggle comments" },

      { "<leader>s", group = "Search options" },
      { "<leader>sw", ":lua require('spectre').open_visual()<CR>", desc = "Search current word (spectre)" },

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
