-- https://github.com/Wansmer/treesj
-- For splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.

return {
 'Wansmer/treesj',
  enabled = true,
  keys = {
    '<space>m',
    '<space>j',
    '<space>s',
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup({--[[ your config ]]})
  end,
}
