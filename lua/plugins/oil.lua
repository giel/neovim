-- https://github.com/stevearc/oil.nvim
-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.
return {
  "stevearc/oil.nvim",
  lazy = true,
  enabled = true,
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Oil" },
  keys = { "-", "<space>-" },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      keymaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      view_options = {
        show_hidden = true,
      },
      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),

      -- Open parent directory in floating window
      vim.keymap.set("n", "<space>-", require("oil").toggle_float),
    })
  end,
}
