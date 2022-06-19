-- https://github.com/folke/which-key.nvim

local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.setup {
		window = {
			border = "double", -- none, single, double, shadow
		}
}

return whichkey
