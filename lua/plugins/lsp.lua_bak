  -- enable LSP

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "K",     "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

  lsp_keymaps(bufnr)

	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)

end


local Plugin = {"VonHeikemen/lsp-zero.nvim"}

-- Plugin.version = "*"

Plugin.enabled = true
Plugin.dependencies = { 
      { "neovim/nvim-lspconfig" , commit = "a63d2c75c6880d45209baff596939343e8a431fd" },
      { "williamboman/mason.nvim",           commit = "61af398d5cf7129564bcd65e2622d21883b9321b" },
      { "williamboman/mason-lspconfig.nvim", commit = "fc78caa46e306103818137759afcc908ab6be948" },

      { "j-hui/fidget.nvim", commit = "44585a0c0085765195e6961c15529ba6c5a2a13b" }, -- Useful status updates for LSP
      { "folke/neodev.nvim", commit = "c5f0a814abf89b5b1e3cfed95322813939bdc0c5" },  -- Additional lua configuration, makes nvim stuff amazing
      { "jose-elias-alvarez/null-ls.nvim"  , commit = "b26851b3e7ac1c0c85666f8a74e36aef2acb89c6" }, -- for formatters and linters
}

function Plugin.config()
  M.setup()
end

return Plugin



-------------------------------------------------------------------------------

  -- enable LSP
  -- use { "williamboman/mason.nvim",           commit = "61af398d5cf7129564bcd65e2622d21883b9321b" } -- * new
  -- use { "williamboman/mason-lspconfig.nvim", commit = "fc78caa46e306103818137759afcc908ab6be948" } -- * new




-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end
--
-- -- require "lsp.lsp-installer"
-- require("lsp.mason")
-- require("lsp.handlers").setup()
-- require "lsp.null-ls"



-------------------------------------------------------------------------------

    -- "VonHeikemen/lsp-zero.nvim",
    -- dependencies = {
    --   "neovim/nvim-lspconfig",
    --   "williamboman/mason.nvim",
    --   "williamboman/mason-lspconfig.nvim",
    --   "onsails/lspkind.nvim",
    --   "hrsh7th/cmp-buffer",
    --   "hrsh7th/cmp-path",
    --   "saadparwaiz1/cmp_luasnip",
    --   "hrsh7th/cmp-nvim-lsp",
    --   "hrsh7th/cmp-nvim-lua",
    --   "L3MON4D3/LuaSnip",
    --   "rafamadriz/friendly-snippets",
    --   "hrsh7th/cmp-nvim-lsp-signature-help",
    --   "hrsh7th/nvim-cmp",
    -- },

-------------------------------------------------------------------------------


-- LSP oorspronkelijk in plugins
-- { "neovim/nvim-lspconfig"            , commit = "a63d2c75c6880d45209baff596939343e8a431fd" }, -- enable LSP
-- { "williamboman/mason.nvim",           commit = "61af398d5cf7129564bcd65e2622d21883b9321b" }, -- * new
-- { "williamboman/mason-lspconfig.nvim", commit = "fc78caa46e306103818137759afcc908ab6be948" }, -- * new

-- { "j-hui/fidget.nvim", commit = "44585a0c0085765195e6961c15529ba6c5a2a13b" }, -- Useful status updates for LSP
-- { "folke/neodev.nvim", commit = "c5f0a814abf89b5b1e3cfed95322813939bdc0c5" },  -- Additional lua configuration, makes nvim stuff amazing
-- { "jose-elias-alvarez/null-ls.nvim"  , commit = "b26851b3e7ac1c0c85666f8a74e36aef2acb89c6" }, -- for formatters and linters
-- { "RRethy/vim-illuminate"            , commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" }, -- highlight word under curso

