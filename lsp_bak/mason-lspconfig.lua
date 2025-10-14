-- https://github.com/williamboman/mason-lspconfig.nvim
local opts = {
  ensure_installed = {
    "bash-language-server", -- does not auto install
    "gopls",
    "lua-language-server",
    "marksman",
    "nil", -- Nix
    "ruff", -- python linter
    "shfmt",
    "stylua",
    "yaml-language-server", -- does not auto install
    -- "codelldb", --debugger
    -- "debugpy",
  },
  automatic_installation = true,
}

return {
  "williamboman/mason.nvim",
  opts = opts,
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}
