-- https://github.com/cappyzawa/trim.nvim
-- This plugin trims trailing whitespace and lines.
return {
  "cappyzawa/trim.nvim",
  enabled = true,
  config = function()
    require("trim").setup({
      ft_blocklist = {},
      patterns = {},
      trim_on_write = false,
      trim_trailing = true,
      trim_last_line = false,
      trim_first_line = true,
      highlight = true,
      highlight_bg = "red",
      -- highlight_bg = "DiffDelete", -- does not work
    })

    -- Keymapping for Trim and TrimToggle defined in keymappings.lua
  end,
}
