-- https://github.com/hrsh7th/nvim-cmp
-- code completion

local icons = require("plugins.config.icons")
local M = {
  "hrsh7th/nvim-cmp",
  enabled = true,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind-nvim",
  },
}

local check_backspace = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

function M.config()
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local luasnip = require("luasnip")

  cmp.setup({

    completion = {
      completeopt = "menu,menuone,noinsert",
      -- keyword_length = 2, -- Minimum length of a word to trigger completion
    },

    performance = {
      debounce = 1000, -- This is the interval used to group up completions from different sources  for filtering and displaying.
      throttle = 300, -- This is used to delay filtering and displaying completions.
      -- fetching_timeout = 200, -- Sets the timeout of candidate fetching process. The nvim-cmp will wait to display the most prioritized source.
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<Up>"] = cmp.mapping.select_prev_item(),
      ["<Down>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<ESC>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },

    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        vim_item.kind = string.format("%s", icons.kind[vim_item.kind])
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },

    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    -- documentation = {
    --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    -- },
    -- --> window.documentation = cmp.config.window.bordered(),
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  })
end

return M
