-- https://github.com/kdheepak/lazygit.nvim
-- lazigit call from neovim

return {
  "kdheepak/lazygit.nvim",
  enabled = true,
  lazy = true,
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
