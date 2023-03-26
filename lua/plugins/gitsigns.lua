-- https://github.com/lewis6991/gitsigns.nvim
-- git changes in gutter

return {
  "lewis6991/gitsigns.nvim",
  -- commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d",

  config = function()
    require("gitsigns").setup({
      signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      numhl = false,
      linehl = false,
      keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      sign_priority = 6,
      update_debounce = 200,
      status_formatter = nil, -- Use default
      --  use_decoration_api = false
    })
  end,
}
