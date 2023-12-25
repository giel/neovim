-- https://github.com/lukas-reineke/indent-blankline.nvim
-- indent guides for Neovim
return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl",

  -- todo make this setting work for version 3
  opts = {
    -- char = "│",
    -- filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
    -- show_trailing_blankline_indent = false,
    -- show_current_context = false,
  },
}
