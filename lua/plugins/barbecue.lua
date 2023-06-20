-- https://github.com/utilyre/barbecue.nvim
-- This is a VS Code like winbar that uses nvim-navic in order to get LSP context from your language server.
return {
  "utilyre/barbecue.nvim",
  enabled = false, -- use lspsaga
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = true,
}
