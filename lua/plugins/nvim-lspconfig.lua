-- add pyright to lspconfig
return
{
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  -- opts = {
  --   ---@type lspconfig.options
  --   servers = {
  --     -- pyright will be automatically installed with mason and loaded with lspconfig
  --     pyright = {},
  --   },
  -- },
   config = function()
      -- vim.lsp.enable('pyright')
    -- "bash-language-server", -- does not auto install
    -- "gopls",
    -- "lua-language-server",
    -- "marksman",
    -- "nil", -- Nix
    -- "ruff", -- python linter
    -- "shfmt",
    -- "stylua",
    -- "yaml-language-server", -- does not auto install

    vim.lsp.enable("bash-language-server")
    vim.lsp.enable("lua-language-server")
    vim.lsp.enable("marksman")
    vim.lsp.enable("stylua")
   end,
}

-- The `require('lspconfig')` "framework" is deprecated, use vim.lsp.config (see :help lspconfig-nvim-0.11)
--  instead.
-- Feature will be removed in nvim-lspconfig v3.0.0
-- stack traceback:
--         .../.local/share/nvim/lazy/nvim-lspconfig/lua/lspconfig.lua:81: in function '__index'
--         ...local/share/nvim/lazy/lazy.nvim/lua/lazy/core/loader.lua:387: in function <...local/share/nvi
-- m/lazy/lazy.nvim/lua/lazy/core/loader.lua:385>
--         [C]: in function 'xpcall'
