-- https://github.com/hoob3rt/lualine.nvim
-- Status Line

return {

"nvim-lualine/lualine.nvim", 
dependencies = { "nvim-tree/nvim-web-devicons" },


opts = {
  options = {
      icons_enabled = true,
      --theme = 'material',
      --theme = 'oceanicnext',
      --theme = 'tomorrow',
      -- theme = 'dracula',
      theme = 'auto',
      component_separators = { left = '', right = '' }, -- {'', ''},
      section_separators = { left = '', right = '' }, -- {left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = { { 'mode', upper = false } },
      lualine_b = { { 'branch', icon = '' } },
      lualine_c = { { 'filename', file_status = true, path = 3 }, 'diagnostics', 'diff' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = { { 'mode', upper = false } },
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = { 'nvim-tree' }
},


}
