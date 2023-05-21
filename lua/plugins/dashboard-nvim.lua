-- https://github.com/nvimdev/dashboard-nvim
-- another blazing fast dashboard

return {
  "glepnir/dashboard-nvim",
  enabled = false,
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      -- config
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
