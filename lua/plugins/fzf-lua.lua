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
        height = 0.90, -- window height
        width = 0.80, -- window width
        row = 0.35, -- window row position (0=top, 1=bottom)
        col = 0.50, -- window col position (0=left, 1=right)

        preview = {
          wrap           = false,           -- preview line wrap (fzf's 'wrap|nowrap')
          hidden         = false,           -- start preview hidden
          vertical       = "down:50%",      -- up|down:size
          horizontal     = "right:60%",     -- right|left:size
          layout         = "vertical",          -- horizontal|vertical|flex
          flip_columns   = 100,             -- #cols to switch to horizontal on flex
        },
      },
    })

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
   map("n", "<leader>fi", ":FzfLua builtin <CR>", { desc = "Find fzf builtins" })
    -- map("n", "<leader>fp", function()
    --   require("fzf-lua").get_recent_projects()
    -- end, { desc = "Recent projects " })
   map("n", "<leader>lw", ":FzfLua diagnostics_document<cr>", { desc = "Diagnostics" })
   map("n", "<leader>ls", ":FzfLua lsp_document_symbols<cr>", { desc = "Document Symbols" })
  end,
}
