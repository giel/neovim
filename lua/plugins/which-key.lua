-- https://github.com/folke/which-key.nvim
-- cheetsheet for keys

return {
  "folke/which-key.nvim",
  dependencies = "nvim-web-devicons",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below

      win = {
        -- don't allow the popup to overlap with the cursor
        no_overlap = true,
        -- width = 1,
        -- height = { min = 4, max = 25 },
        -- col = 0,
        -- row = math.huge,
        border = "single", -- none, single, double, shadow
        padding = { 0, 0 }, -- extra window padding [top/bottom, right/left]
        title = true,
        title_pos = "left",
        zindex = 1000,
        -- Additional vim.wo and vim.bo options
        bo = {},
        wo = {
          -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
        },
      },
      layout = {
        width = { min = 20 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
      },
      keys = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      icons = {
        separator = "", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    })
  end,
}
