-- https://github.com/kdheepak/lazygit.nvim
-- lazigit call from neovim

return {
  "kdheepak/lazygit.nvim",
  enabled = false,
  lazy = true,
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
