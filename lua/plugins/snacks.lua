-- https://github.com/folke/snacks.nvim
-- Snacks is a collections off small utilities for Neovim.
-- - animate: Efficient animation library including over 45 easing functions
-- - bigfile: Open big files without freezing Neovim. (replaces LunarVim/bigfile.nvim)
-- - bufdelete: Delete buffers without disrupting window layout. (replaces famiu/bufdelete.nvim)
-- - dashboard: A start page for Neovim.
-- - explorer: A file explorer for Neovim. (like nvim-neo-tree/neo-tree.nvim)
-- - git: Git utilities for Neovim
-- - gitbrowse: Open the repo of the active file in the browser (e.g., GitHub)
-- - image: Image viewer using Kitty Graphics Protocol, supported by kitty, wezterm and ghostty
-- - indent: Visualize indent guides and scopes based on treesitter or indent.
-- - input: A better input prompt for Neovim.
-- - layouts: Window layouts
-- - lazygit: Open lazygit in the current repo
-- - notifier: Pretty vim.notify
-- - picker: Fuzzy finder for Neovim
-- - profiler: Neovim lua profiler
-- - rename: LSP-integrated file renaming with support for plugins like neo-tree.nvim and mini.files.
-- - scope: Scope detection, text objects and jumping based on treesitter or indent
-- - scroll: Smooth scrolling for Neovim. Properly handles scrolloff and mouse scrolling.
-- - statuscolumn: Pretty status column
-- - words: Auto-show LSP references and quickly navigate between them
return {
  "folke/snacks.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  -- event = "VimEnter", -- for dashboard
  opts = {
    animate = { enabled = false },
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = { enabled = false },
    debug = { enabled = false },
    dim = { enabled = true },
    explorer = { enabled = false },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    image = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    layouts = { enabled = false },
    lazygit = { enabled = true },
    notifier = { enabled = false },
    picker = { enabled = false },
    profiler = { enabled = false },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = false },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    terminal = { enabled = false },
    toggle = { enabled = true },
    words = { enabled = true },
    zen = { enabled = false },
  },
-- stylua: ignore start
  keys = {
    { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse", },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    -- { "<leader>e",  function() Snacks.explorer() end, desc = "Explorer (snacks)" },
    { "<leader>x", function() Snacks.bufdelete() end, desc = "delete (close) buffer",
    },
  }
,
  -- stylua: ignore end
}
