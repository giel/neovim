-- https://github.com/ibhagwan/fzf-lua
-- fzf in lua (instead of telescope)

return {
  "ibhagwan/fzf-lua",
  -- enabled = false,
  enabled = true,
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({})
    if not UseTelescope then
      -- key mappings (equivalent to telescope)
      require("utils")
      map("n", "<leader>bg", ":FzfLua git_files<CR>", { desc = "Browse git files" })
      map("n", "<leader>bh", ":FzfLua helptags<CR>", { desc = "Help tags" })
      map("n", "<leader>bm", ":FzfLua manpages<CR>", { desc = "man pages" })
      --
      map("n", "<leader>fb", ":FzfLua buffers<CR>", { desc = "Buffers" })
      map("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Find File" })
      map("n", "<leader>fg", ":FzfLua grep<CR>", { desc = "Grep File" })
      map("n", "<leader>fw", ":FzfLua grep_cWORD<CR>", { desc = "Grep word under cursor" })
      map("n", "<leader>fr", ":FzfLua oldfiles <CR>", { desc = "Recent files " })

      -- no replacement yet (see telescope plugin)
    end
  end,
}
