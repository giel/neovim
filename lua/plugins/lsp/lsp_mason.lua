-- https://github.com/williamboman/mason.nvim
-- mason.nvim is a Neovim plugin that allows you to easily manage external editor tooling
-- such as LSP servers, DAP servers, linters, and formatters through a single interface.
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    ensure_installed = {
      "gopls",
      "lua-language-server",
      "marksman",
      "ruff", -- python linter
      "shfmt",
      "stylua",
      "yaml-language-server",
      -- "codelldb", --debugger
      -- "debugpy",
    },
  },
  config = function(_, opts)
    require("mason").setup()
    local mr = require("mason-registry")
    for _, tool in ipairs(opts.ensure_installed) do
      local p = mr.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end,
}
