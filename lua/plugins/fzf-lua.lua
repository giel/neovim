-- https://github.com/ibhagwan/fzf-lua
-- fzf in lua (instead of telescope)

return {
  "ibhagwan/fzf-lua",
  enabled = true,
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({

      winopts = {
        fullscreen = false, -- start fullscreen?
        height = 0.95, -- window height
        width = 0.90, -- window width
        row = 0.35, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)

        preview = {
          border = "border", -- border|noborder, applies only to
          wrap = "nowrap", -- wrap|nowrap
          hidden = "nohidden", -- hidden|nohidden
          layout = "vertical", -- horizontal|vertical|flex
        },
      },
    })
    if not UseTelescope then
      -- key mappings (equivalent to telescope)
      require("utils")
      map("n", "<leader>bg", ":FzfLua git_files<CR>", { desc = "Browse git files" })
      map("n", "<leader>bh", ":FzfLua helptags<CR>", { desc = "Help tags" })
      map("n", "<leader>bm", ":FzfLua manpages<CR>", { desc = "man pages" })
      --
      map("n", "<leader>fb", ":FzfLua buffers<CR>", { desc = "Buffers" })
      map("n", "<leader>ff", ":FzfLua files<CR>", { desc = "Find File" })
      map("n", "<leader>fg", ":FzfLua live_grep<CR>", { desc = "Grep File" })
      map("n", "<leader>fw", ":FzfLua grep_cWORD<CR>", { desc = "Grep word under cursor" })
      map("n", "<leader>fr", ":FzfLua oldfiles <CR>", { desc = "Recent files " })

      map("n", "<leader>lw", ":FzfLua diagnostics_document<cr>", { desc = "Diagnostics" })
      map("n", "<leader>ls", ":FzfLua lsp_document_symbols<cr>", { desc = "Document Symbols" })
      -- no replacement yet (see telescope plugin)
    end
  end,
}
