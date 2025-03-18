-- https://github.com/kdheepak/lazygit.nvim
-- lazigit call from neovim
-- now in snacks

return {
  "kdheepak/lazygit.nvim",
  enabled = false,
  lazy = true,
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
