-- https://github.com/akinsho/nvim-bufferline.lua
-- Visual tabs for buffers!

local Plugin = { "akinsho/bufferline.nvim" }

-- Plugin.event = "VeryLazy"
-- Plugin.version = "*"
Plugin.dependencies = { "nvim-tree/nvim-web-devicons", }
Plugin.enabled = true

function Plugin.config()
  local bufferline = require("bufferline")

  bufferline.setup({
    options = {
      mode = "buffers", -- not just vim tabs "tabs",
      numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      offsets = { { filetype = "neo-tree", text = "", padding = 1 } },
      diagnostics = "nvim_lsp",
      buffer_close_icon = "󰅙",
      modified_icon = "",
      close_icon = "󰅙",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 13,
      tab_size = 20,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
      -- separator_style = { "[", "]" }, -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false,
      view = "multiwindow",
      always_show_bufferline = true,
    },
    highlights = {
      buffer_selected = {
        fg = {
            attribute = "fg",
            highlight = "CursorLine",
        },
        bg = {
            attribute = "bg",
            highlight = "CursorLine",
        },
        bold = true,
        italic = true,
      },
      close_button_selected = {
        fg = {
            attribute = "fg",
            highlight = "CursorLine"
        },
        bg = {
            attribute = "bg",
            highlight = "CursorLine"
        },
      },
    },
  })
end

return Plugin
