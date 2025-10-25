-- todo:
--   "shfmt",
--   "bashls",

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
              package_uninstalled = "-",
              -- package_uninstalled = "✗",
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

-- https://neovim.io/doc/user/lsp.html#lsp-defaults
-- LSP SETTINGS DEFAULTS
-- GLOBAL DEFAULTS
-- gra gri grn grr grt i_CTRL-S v_an v_in These GLOBAL keymaps are created unconditionally when Nvim starts:
-- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
-- "gri" is mapped in Normal mode to vim.lsp.buf.implementation()
-- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
-- "grr" is mapped in Normal mode to vim.lsp.buf.references()
-- "grt" is mapped in Normal mode to vim.lsp.buf.type_definition()
-- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()
-- "an" and "in" are mapped in Visual mode to outer and inner incremental selections, respectively, using vim.lsp.buf.selection_range()
-- BUFFER-LOCAL DEFAULTS
-- 'omnifunc' is set to vim.lsp.omnifunc(), use i_CTRL-X_CTRL-O to trigger completion.
-- 'tagfunc' is set to vim.lsp.tagfunc(). This enables features like go-to-definition, :tjump, and keymaps like CTRL-], CTRL-W_], CTRL-W_} to utilize the language server.
-- 'formatexpr' is set to vim.lsp.formatexpr(), so you can format lines via gq if the language server supports it.
-- To opt out of this use gw instead of gq, or clear 'formatexpr' on LspAttach.
-- K is mapped to vim.lsp.buf.hover() unless 'keywordprg' is customized or a custom keymap for K exists.
-- Document colors are enabled for highlighting color references in a document.
-- To opt out call vim.lsp.document_color.enable(false, args.buf) on LspAttach.

