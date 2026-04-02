-- https://github.com/nvim-treesitter/nvim-treesitter
-- syntax higlighting and more
-- This is a full, incompatible, rewrite: since neovim 0.12

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
}


-- Use `TSInstall` modulename to actually install modulename
-- TSInstall bash c_sharp css go gomod hcl html json lua markdown python toml yaml
