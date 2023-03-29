-- https://github.com/echasnovski/mini.animate
-- Animate common Neovim actions
return {
  "echasnovski/mini.animate",
  version = "*",
  enabled = true,
  config = function()
    require("mini.animate").setup()
  end,
}
