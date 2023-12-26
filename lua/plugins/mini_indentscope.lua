-- https://github.com/echasnovski/mini.indentscope
-- Visualize and work with indent scope

-- similair to indent-blankline, but only show vertical line in the scope of the cursor,
-- so this one disabled
return {
  "echasnovski/mini.indentscope",
  -- version = "*",
  version = false,
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    symbol = "│",
    options = { try_as_border = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  config = function(_, opts)
    require("mini.indentscope").setup(opts)
  end,
}
