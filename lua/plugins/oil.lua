-- https://github.com/stevearc/oil.nvim
-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
return {
  "stevearc/oil.nvim",
  lazy = true,
  enabled = true,
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Oil" },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
    })
  end,
}
