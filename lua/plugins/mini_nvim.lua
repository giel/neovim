-- https://github.com/echasnovski/mini.nvim
-- set of 20+ mini utilities
return {
  "echasnovski/mini.nvim",
  -- version = "*",
  version = false,
  enabled = true,
  config = function()
    -- Animate common Neovim actions
    require("mini.animate").setup()
    -- Visualize and work with indent scope
    require("mini.indentscope").setup()
  end,
}
