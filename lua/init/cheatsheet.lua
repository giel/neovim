-- https://github.com/sudormrfbin/cheatsheet.nvim

local status_ok, cheatsheet = pcall(require, "cheatsheet")
if not status_ok then
  return
end

cheatsheet.setup({
    -- Whether to show bundled cheatsheets

    -- For generic cheatsheets like default, unicode, nerd-fonts, etc
    bundled_cheatsheets = {
    --     enabled = {},
         disabled = {'nerd-fonts' },
    },

    -- For plugin specific cheatsheets
    bundled_plugin_cheatsheets = true,
    -- bundled_plugin_cheatsheets = {
    --     enabled = {},
        -- disabled = {'netrw-vim'},
    -- },

    -- For bundled plugin cheatsheets, do not show a sheet if you
    -- don't have the plugin installed (searches runtimepath for
    -- same directory name)
    include_only_installed_plugins = true,
})

