-- local toInstall = {
--   "bashls",
--   "gopls",
--   "lua-ls",
--   "marksman",
--   "shfmt",
--   "stylua",
-- }

-- return
--  {
--   "williamboman/mason-lspconfig.nvim",
--   dependencies = {
--     "williamboman/mason.nvim",
--     "neovim/nvim-lspconfig",
--   },
--   config = function()
--     require("mason").setup()
--     require("mason-lspconfig").setup({
--       ensure_installed =  {
--         "bashls",
--         "gopls",
--         "marksman",
--         "stylua"
--       },
--       automatic_installation = true,
--     })
--   end,
-- }

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "cssls",
        "gopls",
        "graphql",
        "html",
        "lua_ls",
        "marksman",
        "pyright",
        "tailwindcss",
        "ts_ls",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "black", -- python formatter
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
