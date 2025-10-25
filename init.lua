-- General mappings
require("settings")
require("lazyinit")
-- plugins are defined in lua/plugins

require("lsp_setings")


-- for now colorscheme is choosen in plugins/colorschemes
-- require("colorscheme")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("autocommands")
    require("keymappings")
    require("filetypes")
  end,
})

vim.api.nvim_create_user_command("Hsplit", "split", {})
