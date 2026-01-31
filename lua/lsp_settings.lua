-- This file is for setting up LSP-related keybindings and configurations
-- setup inspired by https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/lsp.lua

local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }


  -- Most keybinds are now following the defaults of Neovim.
  -- So I don't need to set them here anymore.
  -- set keybinds
  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

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

