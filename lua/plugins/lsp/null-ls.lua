-- https://github.com/jose-elias-alvarez/null-ls.nvim
-- Use Neovim as a language server to inject LSP diagnostics,
-- code actions, and more via Lua.
return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  config = function()
    local nls = require("null-ls")
    nls.setup({
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.black,
        nls.builtins.formatting.shfmt,
        nls.builtins.diagnostics.ruff.with({ extra_args = { "--max-line-length=180" } }),
      },
    })
  end,
}
