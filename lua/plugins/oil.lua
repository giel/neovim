-- https://github.com/stevearc/oil.nvim
-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  enabled = true,
  opts = {
    default_file_explorer = false,
    keymaps = {
      ["<Esc>"] = { "actions.close", mode = "n" },
      ["<C-h>"] = false,
    },
    view_options = {
      show_hidden = true,
    },
  },
}
