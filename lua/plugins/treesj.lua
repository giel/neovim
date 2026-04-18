-- https://github.com/Wansmer/treesj
-- For splitting/joining blocks of code like arrays, hashes, statements, objects, dictionaries, etc.

return {
 'Wansmer/treesj',
  enabled = true,
  keys = { {
    '<space>m',
    desc = "toggle split/join",
  }, {
    '<space>j',
    desc = "join list",
  }, {
    '<space>s',
    desc = "split list",
  } },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup({--[[ your config ]]})
  end,
}


