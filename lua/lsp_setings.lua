-- LSP handlers configuration
local icons = require("plugins.config.icons")
local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.Info },
  }
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

-- local config = {
--   float = {
--     focusable = true,
--     style = "minimal",
--     border = "rounded",
--   },
--
--   diagnostic = {
--     -- virtual_text = false,
--     -- virtual_text = { spacing = 4, prefix = "●" },
--     virtual_text = {
--       severity = {
--         min = vim.diagnostic.severity.ERROR,
--       },
--     },
--     signs = {
--       active = signs,
--     },
--     underline = false,
--     update_in_insert = false,
--     severity_sort = true,
--     float = {
--       focusable = true,
--       style = "minimal",
--       border = "rounded",
--       source = "always",
--       header = "",
--       prefix = "",
--     },
--     -- virtual_lines = true,
--   },
-- }
--
-- -- Diagnostic configuration
-- vim.diagnostic.config(config.diagnostic)
--
-- -- Hover configuration
-- -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
--
-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--   vim.lsp.handlers.hover,
--   {
--     border = "rounded",     -- or "single", "double", "shadow"
--     max_width = 80,
--     max_height = 20,
--   }
-- )
-- -- Signature help configuration
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
--
