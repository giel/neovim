-- https://github.com/folke/which-key.nvim

local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.setup {
  window = {
    border = "double",        -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 0, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  presets = {
    operators = true,    -- adds help for operators like d, y, ...
    motions = true,      -- adds help for motions
    text_objects = true, -- help for text objects triggered after entering an operator
    windows = false,     -- default bindings on <c-w>
    nav = true,          -- misc bindings to work with windows
    z = true,            -- bindings for folds, spelling and others prefixed with z
    g = true,            -- bindings for prefixed with g
  },

}

return whichkey
