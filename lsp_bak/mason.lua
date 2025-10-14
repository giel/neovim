-- https://github.com/williamboman/mason.nvim
-- mason.nvim is a Neovim plugin that allows you to easily manage external editor tooling
-- such as LSP servers, DAP servers, linters, and formatters through a single interface.
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "BufReadPre",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    ui = {
      border = "single", -- ex: none, double, shadow. See help nvim_open_win "border"
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
