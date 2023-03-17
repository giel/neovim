-- https://github.com/akinsho/nvim-bufferline.lua
-- Visual tabs for buffers!

local Plugin = {"akinsho/bufferline.nvim"}

Plugin.commit = "3677aceb9a72630b0613e56516c8f7151b86f95c"

function Plugin.config()

local bufferline = require("bufferline")

bufferline.setup {
  options = {
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    indicator = { style = "icon", icon = "▎" },
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
    always_show_bufferline = true
  }
}

end

return Plugin