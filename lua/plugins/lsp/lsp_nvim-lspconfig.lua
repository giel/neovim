-- https://github.com/neovim/nvim-lspconfig
-- Configs for the Nvim LSP client (:help lsp).
return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim", opts = {
      library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
    } },
    -- fidget: Standalone UI for nvim-lsp progress. Eye candy for the impatient.
    -- tagged to legacy branch untill refactored
    { "j-hui/fidget.nvim", config = true, tag = "legacy" },
    { "smjonas/inc-rename.nvim", config = true },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "jay-babu/mason-null-ls.nvim",
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = { callSnippet = "Replace" },
            telemetry = { enable = false },
            hint = {
              enable = false,
            },
          },
        },
      },
      dockerls = {},
      yamlls = {
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      },
    },
    setup = {
      lua_ls = function(_, _)
        local lsp_utils = require("plugins.lsp.utils")
        lsp_utils.on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "lua_ls" then
              vim.keymap.set("n", "<leader>dX", function() require("osv").run_this() end, { buffer = buffer, desc = "OSV Run" })
              vim.keymap.set("n", "<leader>dL", function() require("osv").launch({ port = 8086 }) end, { buffer = buffer, desc = "OSV Launch" })
            end
        end)
      end,
    },
  },
  config = function(plugin, opts)
    require("plugins.lsp.servers").setup(plugin, opts)
  end,
}
