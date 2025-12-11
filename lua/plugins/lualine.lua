-- https://github.com/hoob3rt/lualine.nvim
-- Status Line

local Plugin = { "nvim-lualine/lualine.nvim" }
Plugin.dependencies = "nvim-tree/nvim-web-devicons"
Plugin.enabled = true

-- get the path from lspsaga to show it in the winbar (on top)
local function pathInCode()
  hi = require("lspsaga.symbolwinbar"):get_winbar()
  return hi
end

local function toggle_eye()
  if vim.opt.list:get() then
    return "󰈈" -- Eye open when invisible characters are visible
  else
    return "󰈉" -- Closed eye when invisible characters are hidden
  end
end

local function lsp_active()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    return "" -- LSP active icon
  else
    return " " -- LSP inactive icon
  end
end

local function visual_selection_count()
  local mode = vim.fn.mode()

  -- Visual character mode
  if mode == "v" then
    local start = vim.fn.getpos("v")
    local finish = vim.fn.getpos(".")
    -- line, col
    local sline, scol = start[2], start[3]
    local fline, fcol = finish[2], finish[3]

    if sline == fline then
      -- same line → pure character count
      local count = math.abs(fcol - scol) + 1
      return string.format("%d C", count)
    else
      -- multi-line visual char selection
      -- total characters is ambiguous; show lines instead
      local count = math.abs(fline - sline) + 1
      return string.format("%d L", count)
    end
  end

  -- Visual line mode
  if mode == "V" then
    local start_line = vim.fn.line("v")
    local current_line = vim.fn.line(".")
    local count = math.abs(current_line - start_line) + 1
    return string.format("%d L", count)
  end

  -- Visual block mode (optional)
  if mode == "\22" then  -- CTRL-V
    local start = vim.fn.getpos("v")
    local finish = vim.fn.getpos(".")
    local sline, scol = start[2], start[3]
    local fline, fcol = finish[2], finish[3]
    local height = math.abs(fline - sline) + 1
    local width  = math.abs(fcol - scol) + 1
    return string.format("%dx%d B", height, width)
  end

  return ""

end

function Plugin.config()
  local lualine = require("lualine")
  -- to configure lazy pending updates count
  local lazy_status = require("lazy.status")

  lualine.setup({
    options = {
      icons_enabled = true,
      -- Dark themes
      -- theme = "material",
      -- theme = "dracula",

      -- Auto generated theme based on colorscheme
      -- theme = "auto",

      -- Light themes
      theme = "Tomorrow",
      -- theme = "onelight",
      -- theme = "iceberg_light",
      component_separators = { left = "", right = "" }, -- {'', ''},
      section_separators = { left = "", right = "" }, -- {left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          function()
            local recording = vim.fn.reg_recording()
            return recording ~= "" and "󰑋 " .. recording or "   "
          end,
          cond = function()
            return vim.fn.reg_recording() ~= "   "
          end,
          color = { fg = "#ff9e64", gui = "bold" }, -- Optional: Customize color
        },
        { "mode", upper = false },
        toggle_eye,
      },
      lualine_b = { { "branch", icon = "" } },
      lualine_c = { { "filename", file_status = true, path = 0 }, "diff" },
      lualine_x = {
        {
          lazy_status.updates,
          cond = lazy_status.has_updates,
          color = { fg = "#ff9e64" },
        },
        "filesize",
        "encoding",
        "fileformat",
        "filetype",
        lsp_active,
      },
      lualine_y = { visual_selection_count, "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {
        { "mode", upper = false },
      },
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    winbar = {
      lualine_a = { "diagnostics" },
      lualine_b = {},
      lualine_c = { { "filename", file_status = true, path = 3 }, "diff", pathInCode },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },

    inactive_winbar = {
      lualine_a = { "diagnostics" },
      lualine_b = {},
      lualine_c = { { "filename", file_status = true, path = 0 } },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "neo-tree" },
  })
end

return Plugin
