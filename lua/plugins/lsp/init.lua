-- lsp functionality starts here!
-- manually load some import lsp configs from here
return {
  require("plugins.lsp.nvim-lspconfig"),
  require("plugins.lsp.null-ls"),
  require("plugins.lsp.mason"),
  require("plugins.lsp.mason-lspconfig"),
  require("plugins.lsp.mason-null-ls"),
  require("plugins.lsp.lspsaga"),
}
