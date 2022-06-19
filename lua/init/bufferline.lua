-- https://github.com/akinsho/nvim-bufferline.lua

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
    options = {
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = false,
        view = "multiwindow",
        always_show_bufferline = true,
        -- mappings = false -- default, else <leader>1-9 will be mapped
    },
    highlights = {
      fill = {
        guifg = { attribute = "fg", highlight = "#ff0000" },
        guibg = { attribute = "bg", highlight = "TabLine" },
      },

  }
}
