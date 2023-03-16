-- https://github.com/nvim-telescope/telescope.nvim
-- Telescope (a highly extendable fuzzy finder over lists)
-- use default settings of telescope, overrides see below

local Plugin = {'nvim-telescope/telescope.nvim'}

Plugin.commit = "e960efa60e97df58e089b00270f09d60f27202c8" 

Plugin.cmd = 'Telescope'


function Plugin.config()

  local command = vim.api.nvim_create_user_command

  local telescope = require('telescope')
  local actions = require('telescope.actions')


  telescope.setup {
    defaults = {

    prompt_prefix = " ",
    selection_caret = " ",

    sorting_strategy = "ascending",
    -- file_sorter = require("telescope.sorters").get_fzy_sorter,
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { shorten = 5 },
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,

  }
}
end


return Plugin
