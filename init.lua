-- General mappings
require('settings')
require('lazyinit')
require('colorscheme')

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "autocommands"
    require "keymappings"
  end,
})


-- Plugins specific inits
-- require('init.project')      -- project detection
-- require('lsp')               -- global lsp install

