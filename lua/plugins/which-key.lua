-- https://github.com/folke/which-key.nvim
-- cheetsheet for keys

return {

-- { 'folke/which-key.nvim' , commit = "8682d3003595017cd8ffb4c860a07576647cc6f8" },
"folke/which-key.nvim",
config = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  require("which-key").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below

  window = {
    border = "double",        -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 0, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  presets = {
    operators = true,    -- adds help for operators like d, y, ...
    motions = true,      -- adds help for motions
    text_objects = true, -- help for text objects triggered after entering an operator
    windows = false,     -- default bindings on <c-w>
    nav = true,          -- misc bindings to work with windows
    z = true,            -- bindings for folds, spelling and others prefixed with z
    g = true,            -- bindings for prefixed with g
  },



  })
end,

}