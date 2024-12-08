-- https://github.com/folke/snacks.nvim
-- Snacks is a collections off small utilities for Neovim.
-- - gitbrowse: Open the repo of the active file in the browser (e.g., GitHub)
-- - lazygit: Open lazygit in the current repo
-- - bufdelete: Delete buffers without disrupting window layout.
return {
  "folke/snacks.nvim",
  enabled = true,
  opts = {
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    bufdelete = { enabled = false },
  },
-- stylua: ignore start
  keys = {
    { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse", },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
  },
  -- stylua: ignore end
}
