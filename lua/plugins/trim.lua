-- https://github.com/cappyzawa/trim.nvim
-- This plugin trims trailing whitespace and lines.
return {
  "cappyzawa/trim.nvim",
  enabled = true,
  config = function()
    require("trim").setup({
      ft_blocklist = { "lazy", "markdown", "which-key" },
      patterns = {},
      trim_on_write = true,
      trim_trailing = true,
      trim_last_line = false,
      trim_first_line = true,
      highlight = false,
      highlight_bg = "#ff9040",
      -- highlight_bg = "DiffDelete", -- does not work
    })

    -- Keymapping for Trim and TrimToggle defined in keymappings.lua

    require("utils")
    -- under the c group (code)
    map("n", "<leader>cT", ":TrimToggle<CR>", { desc = "Toggle trim on save" })
    map("n", "<leader>ct", ":Trim<CR>", { desc = "remove trailing space" })
  end,
}
