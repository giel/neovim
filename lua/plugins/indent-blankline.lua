-- https://github.com/lukas-reineke/indent-blankline.nvim
-- indent guides for Neovim
-- similair to mini_indentscope, but always shows vertical indentlines

local highlight = {
  "CursorColumn",
  "Whitespace",
}

return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl",

  opts = {
    whitespace = {
      remove_blankline_trail = false,
    },

    exclude = { filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" } },
    -- indent = { char = "│" },
    indent = { char = "┊" },
  },
}
