-- https://github.com/hoob3rt/lualine.nvim

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

--local lualine = require('lualine')

--local function bufferNumber()
--	-- TODO bufnr('$') show max buffer number ??
--  local cur_winnr, cur_bufnr, cur_bufcnt = vim.fn.winnr(), vim.fn.bufnr(), vim.fn.bufnr('$') -1
--  return string.format('b%d/%d-w%d', cur_bufnr, cur_bufcnt, cur_winnr)
--end

lualine.setup{
        options = {
          icons_enabled = true,
          --theme = 'material',
          --theme = 'oceanicnext',
          --theme = 'tomorrow',
          -- theme = 'dracula',
          theme = 'auto',
          component_separators = { left='', right=''}, -- {'', ''},
          section_separators = { left='', right=''}, -- {left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = false,
        },
        sections = {
          lualine_a = { {'mode', upper = false} },
          lualine_b = { {'branch', icon = ''}, 'diagnostics' },
          lualine_c = { {'filename', file_status = true} },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location'  },
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = {  },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {  },
          lualine_z = {  }
        },
        tabline = {},
        extensions = { 'nvim-tree' }
      }
