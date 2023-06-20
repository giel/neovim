-- lsp functionality starts here!
-- manually load some import lsp configs from here
return {
  require("plugins.lsp.lsp_nvim-lspconfig"),
  require("plugins.lsp.lsp_null-ls"),
  require("plugins.lsp.lsp_mason"),
  require("plugins.lsp.lsp_mason-null-ls"),
  require("plugins.lsp.lsp_lspsaga"),
}
