-- https://github.com/MagicDuck/grug-far.nvim
-- Find And Replace plugin for neovim
return {
  "MagicDuck/grug-far.nvim",
  version = "1.6.3", -- Use for stability; omit to use `main` branch for the latest features
  enabled = true,
  config = function()
    require("grug-far").setup({
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      windowCreationCommand = "split",
    })
  end,
}
