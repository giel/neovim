-- https://github.com/sudormrfbin/cheatsheet.nvim
-- cheesheet for cheetsheet.txt


local Plugin = {'sudormrfbin/cheatsheet.nvim' }

Plugin.commit = "9716f9aaa94dd1fd6ce59b5aae0e5f25e2a463ef"

function Plugin.config()

local cheatsheet = require("cheatsheet")

cheatsheet.setup({
  -- Whether to show bundled cheatsheets

  -- For generic cheatsheets like default, unicode, nerd-fonts, etc
  bundled_cheatsheets = {
    -- enabled = {},
    disabled = { 'nerd-fonts' },
  },

  -- For plugin specific cheatsheets
  bundled_plugin_cheatsheets = true,
  -- bundled_plugin_cheatsheets = {
  --   enabled = {},
  --   disabled = {'netrw-vim'},
  -- },

  -- For bundled plugin cheatsheets, do not show a sheet if you
  -- don't have the plugin installed (searches runtimepath for
  -- same directory name)
  include_only_installed_plugins = true,

  -- Key mappings bound inside the telescope window
  telescope_mappings = {
    ['<CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
    ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
    ['<C-Y>'] = require('cheatsheet.telescope.actions').copy_cheat_value,
    ['<C-E>'] = require('cheatsheet.telescope.actions').edit_user_cheatsheet,
  }
})
end

return Plugin