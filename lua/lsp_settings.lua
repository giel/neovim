-- This file is for setting up LSP-related keybindings and configurations
-- setup inspired by https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/lsp.lua

local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
  if UseTelescope then
    opts.desc = "LSP references"
    keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    opts.desc = "LSP definition"
    keymap.set("n", "gd", "Telescope lsp_definitions", opts )
    -- TODO: enable these later
    -- self:map("gI", "Telescope lsp_implementations", { desc = "Goto Implementation" })
    -- self:map("gb", "Telescope lsp_type_definitions", { desc = "Goto Type Definition" })
    -- self:map("<leader>cs", require("telescope.builtin").lsp_document_symbols, { desc = "Document Symbols" })
    -- self:map("<leader>cS", require("telescope.builtin").lsp_dynamic_workspace_symbols, { desc = "Workspace Symbols" })
  else
    opts.desc = "LSP references"
    keymap.set("n", "gr", ":FzfLua lsp_references<CR>", opts)
    opts.desc = "LSP definition"
    keymap.set("n", "gd", ":FzfLua lsp_definitions<CR>", opts )
    opts.desc = "LSP Goto Implementation"
    keymap.set("n", "gi", ":FzfLua lsp_implementations<CR>", opts )
    opts.desc = "LSP Goto Type Definition"
    keymap.set("n", "gb", ":FzfLua lsp_typedefs<CR>", opts)
  end

  opts.desc = "Signature Help"
  keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
  opts.desc = "Smart rename"
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, opts) -- jump to previous diagnostic in buffer
  --
  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, opts) -- jump to next diagnostic in buffer

  end,
})

local severity = vim.diagnostic.severity
local icons = require("plugins.config.icons")

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = icons.diagnostics.Error,
      [severity.WARN] = icons.diagnostics.Warning,
      [severity.HINT] = icons.diagnostics.Hint,
      [severity.INFO] = icons.diagnostics.Info,
    },
  },
})

