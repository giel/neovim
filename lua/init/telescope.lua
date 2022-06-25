-- https://github.com/nvim-telescope/telescope.nvim
-- use default settings of telescope, overrides see below

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

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
