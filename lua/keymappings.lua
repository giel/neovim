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
map("i", "<C-S-Y>", "<Plug>(copilot-accept-word)", { desc = "Accepts word of copilot suggestion" })
map("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next copilot suggestion" })
map("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Previous copilot suggestion" })
map("i", "<C-Y>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  desc = "Accepts whole copilot suggestion",
})
vim.g.copilot_no_tab_map = true

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
        { name = "+code related", _ = "which_key_ignore" },
        ["S"] = { ":w<CR>:source %<CR>", "save&source current buffer" },
        ["s"] = { ":w<CR>:luafile %<CR>", "save&luafile current buffer" },
        ["t"] = { ":Trim<CR>", "remove trailing space" },
        ["T"] = { ":TrimToggle<CR>", "Toggle trim on save" },
        ["p"] = { ":Copilot panel<CR>", "Copilot panel" },
      },
      f = {
        name = "+file Telescope",
        b = { ":Telescope buffers<CR>", "Buffers" },
        f = { ":Telescope find_files<CR>", "Find File" },
        g = { ":Telescope live_grep<CR>", "Grep File" },
        w = {
          ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<CR>",
          "Grep fileword under cursor",
        },
        p = { ":Telescope projects<CR>", "Projects" },
        r = { ":Telescope oldfiles <CR>", "Recent files " },
        n = { ":enew<CR>", "New File" },
      },
      g = {
        name = "+goto related",
      },
      i = {
        name = "increment selection related",
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
      o = {
        name = "Obsidian options",
        ["o"] = { ":ObsidianOpen<CR>", "Open buffer in Obsidian" },
        ["n"] = { ":ObsidianNew<CR>", "New Obsidion document" },
        ["w"] = { ":ObsidianWorkspace<CR>", "Obsidion workspace" },
      },
      s = {
        name = "Search options (spectre)",
        ["s"] = { ":lua require('spectre').open()<CR>", "Search/Replace in files" },
        ["w"] = { ":lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
        ["p"] = {
          ":lua require('spectre').open_file_search({select_word=true})<CR>",
          "Search word in current file",
        },
      },
      t = {
        name = "tabs/buffers actions",
        ["l"] = { ":BufferLineCloseLeft<CR>", "close all buffers to the left" },
        ["n"] = { ":tabnew<CR>", "new tab" },
        ["o"] = { ":BufferLineCloseOthers<CR>", "close other buffers" },
        ["p"] = { ":BufferLinePick<CR>", "choose tab letter to activate" },
        ["r"] = { ":BufferLineCloseRight<CR>", "close all buffers to the right" },
        ["x"] = { ":Bdelete<CR>", "close tab" },
      },
      v = {
        name = "Text/view options",
        ["s"] = { ":set spell!<CR>", "toggle spell check" },
        ["w"] = { ":set wrap!<CR>", "toggle word wrap" },
        ["0"] = { ":set relativenumber!<CR>", "toggle rel. line #" },
        ["9"] = { ":set number!<CR>", "toggle line #" },
      },
      -- ["."] = { ":BufferLineCycleNext<CR>", "next Bufferline" },
      -- [","] = { ":BufferLineCyclePrev<CR>", "previous Bufferline" },
      [","] = { ":bprevious<CR>", "previous buffer" },
      ["."] = { ":bnext<CR>", "next buffer" },
      ["<"] = { ":bfirst<CR>", "go to first buffer" },
      [">"] = { ":blast<CR>", "go to last buffer" },
      -- Bdelete allows closing buffers without closing window (unlike bdelete)
      ["x"] = { ":Bdelete<CR>", "delete (close) buffer" },
      ["a"] = { ":Alpha<CR>", "alpha start menu" },
      ["h"] = { ":set hlsearch!<CR>", "toggle search highlight" },
      ["/"] = { ":CommentToggle<CR>", "toggle comment" },
      ["?"] = { ":Cheatsheet<CR>", "cheat Sheet" },
      ["e"] = { ":Neotree toggle<cr>", "NeoTree" },
    },
  })
  local visualmappings = {
    ["<leader>"] = {
      s = {
        name = "Search options",
        ["w"] = { ":lua require('spectre').open_visual()<CR>", "Search current word (spectre)" },
      },
      t = {
        name = "+tabularize",
        ["|"] = { "<cmd>Tabularize/|/<CR>", " | " },
        ["\\"] = { "<cmd>Tabularize/|/<CR>", " | " },
        ["d"] = { "<cmd>Tabularize/--/<CR>", " -- " },
        ["="] = { "<cmd>Tabularize/=/<CR>", " = " },
        [","] = { "<cmd>Tabularize/,/<CR>", " , " },
        [":"] = { "<cmd>Tabularize/:/<CR>", " : " },
      },

      ["/"] = { ":CommentToggle<CR>", "toggle comments" },
    },
  }
  wk.register(visualmappings, { mode = "v" })
end
