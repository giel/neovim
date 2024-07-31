-- https://github.com/nvim-telescope/telescope.nvim
-- Telescope (a highly extendable fuzzy finder over lists)
-- use default settings of telescope, overrides see below

local Plugin = { "nvim-telescope/telescope.nvim" }

Plugin.cmd = "Telescope"
Plugin.enabled = true

function Plugin.config()
  local command = vim.api.nvim_create_user_command

  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {

      prompt_prefix = ": ",
      selection_caret = "> ",

      -- layout_strategy = "horizontal",
      -- layout_strategy = "flex",
      -- layout_strategy = "bottom_pane",
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          mirror = true,
          prompt_position = "top",
        },
        width = 0.95,
        height = 0.95,
        -- preview_cutoff = 40,
      },

      sorting_strategy = "ascending",
      -- file_sorter = require("telescope.sorters").get_fzy_sorter,
      -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { shorten = 5 },
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    },
  })
  -- key mappings
  require("utils")
  map("n", "<leader>bg", ":Telescope git_files<CR>", { desc = "Browse git files" })
  map("n", "<leader>bh", ":Telescope help_tags<CR>", { desc = "Help tags" })
  map("n", "<leader>bm", ":Telescope man_pages<CR>", { desc = "man pages" })

  map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buffers" })
  map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find File" })
  map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Grep File" })
  map("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Projects" })
  map("n", "<leader>fr", ":Telescope oldfiles <CR>", { desc = "Recent files " })
  map(
    "n",
    "<leader>fw",
    ":lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<CR>",
    { desc = "Grep fileword under cursor" }
  )

  map("n", "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })
  map("n", "<leader>ld", ":Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { desc = "Buffer Diagnostics" })
  map("n", "<leader>le", ":Telescope quickfix<cr>", { desc = "Telescope Quickfix" })

  map("n", "<leader>ls", ":Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
  map("n", "<leader>lw", ":Telescope diagnostics<cr>", { desc = "Diagnostics" })
end

return Plugin
