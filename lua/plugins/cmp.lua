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

-- TODO change to use config.icons
--   פּ ﯟ   some other good icons
-- local kind_icons = {
--   Class = icons.kind.Class,
--   Color = icons.kind.Color,
--   Constant = icons.kind.Constant,
--   Constructor = "",
--   Enum = "",
--   EnumMember = "",
--   Event = "",
--   Field = "",
--   File = icons.kind.File,
--   Folder = icons.kind.Folder,
--   Function = icons.kind.Function,
--   Interface = "",
--   Keyword = "",
--   Method = "m",
--   Module = "",
--   Operator = "icons.kind.Operator",
--   Property = "",
--   Reference = "",
--   Snippet = "",
--   Struct = "",
--   Text = icons.kind.Text,
--   TypeParameter = icons.kind.TypeParameter,
--   Unit = "",
--   Value = icons.kind.Value,
--   Variable = icons.kind.Variable,
-- }
-- find more here: https://www.nerdfonts.com/cheat-sheet

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
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },

    mapping = {
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<ESC>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif check_backspace() then
          fallback()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
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
