local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Packer can manage itself as an optional plugin
  use { "wbthomason/packer.nvim"        , commit = "64ae65fea395d8dc461e3884688f340dd43950ba" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim"         , commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "kyazdani42/nvim-web-devicons"  , commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622" } -- web icons needed a lot (nvim-tree i.e.)
  use { "kyazdani42/nvim-tree.lua"      , commit = "29788cc32a153e42b2fe48344d315da8367fc6fa" } -- File Explorer nvim-tree
  use { "moll/vim-bbye"                 , commit = "25ef93ac5a87526111f43e5110675032dbcacf56" } -- provide Bdelete function
  use { "ahmedkhalf/project.nvim"       , commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" } -- projects
  use { "akinsho/bufferline.nvim"       , commit = "4ecfa81e470a589e74adcde3d5bb1727dd407363" } -- Visual tabs for buffers!
  use { "nvim-lualine/lualine.nvim"     , commit = "bfa0d99ba6f98d077dd91779841f1c88b7b5c165" } -- Status Line
  use { 'godlygeek/tabular'             , commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a" } -- * Tabular for aligning tables https://github.com/godlygeek/tabular
  use { "terrortylor/nvim-comment"      , commit = "e9ac16ab056695cad6461173693069ec070d2b23" } -- * commenter
  use { "lewis6991/impatient.nvim"      , commit = "9f7eed8133d62457f7ad2ca250eb9b837a4adeb7" } -- Speed up loading Lua modules in Neovim
  use { "goolord/alpha-nvim"            , commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb" } -- Splash screen

  -- Information
  use 'nanotee/nvim-lua-guide'  -- :help nvim-lua-guide

  -- Helper functions for nvim in lua
  -- use 'norcalli/nvim_utils'

  -- cmp plugins
  use { "hrsh7th/nvim-cmp"          , commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer"        , commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path"          , commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
  use { "hrsh7th/cmp-cmdline"       , commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip"  , commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp"      , commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua"      , commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- snippets
  use { "L3MON4D3/LuaSnip"            , commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } -- snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig"            , commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  -- use { "williamboman/nvim-lsp-installer"  , commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- * simple to use language server installer
  -- use { 'tamago324/nlsp-settings.nvim'     , commit = '527cdfef1b1eb47eb3e6e6f737575a710f307d3a' } -- * language server settings defined in json for
  use { "williamboman/mason.nvim",           commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" } -- * new
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" } -- * new
 

  use { "jose-elias-alvarez/null-ls.nvim"  , commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate"            , commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" } -- highlight word under curso
  -- use 'onsails/lspkind-nvim'
  -- use 'kosayoda/nvim-lightbulb'
  -- use 'mfussenegger/nvim-jdtls'

  -- Treesitter syntax highlighting
  use {'nvim-treesitter/nvim-treesitter' , commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac", run = ':TSUpdate'}
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  -- use 'nvim-treesitter/playground'
  -- use 'p00f/nvim-ts-rainbow'

  -- Telescope (a highly extendable fuzzy finder over lists)
  use {'nvim-telescope/telescope.nvim', commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }
  -- use 'f-person/git-blame.nvim'
  -- use 'tpope/vim-fugitive'
  -- use 'tpope/vim-rhubarb'

  -- surround brackets, qoutes, tags: https://tpope.io/vim/surround.git
  -- and repeat to enable repeating surround commands: https://github.com/tpope/vim-repeat
  use { 'https://tpope.io/vim/surround.git'   , commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea" } -- *
  use { 'https://github.com/tpope/vim-repeat' , commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" } -- *

  -- another simple surround plugin. https://github.com/ur4ltz/surround.nvim
  -- use {
  --   "ur4ltz/surround.nvim",
  --   config = function()
  --     require"surround".setup {mappings_style = "sandwich"}
  --   end
  -- }
  -- another surround: https://github.com/echasnovski/mini.nvim#minisurround
  -- other surround plugin.
  -- https://github.com/machakann/vim-sandwich

  use { 'norcalli/nvim-colorizer.lua' , commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" }  -- * colors the css hex values
  use { 'folke/which-key.nvim'        , commit = "6885b669523ff4238de99a7c653d47b081b5506d" }  -- cheetsheet for keys
  use { 'sudormrfbin/cheatsheet.nvim' , commit = "9716f9aaa94dd1fd6ce59b5aae0e5f25e2a463ef" }  -- cheesheet for cheetsheet.txt

  -- colorschemes
  use 'NLKNguyen/papercolor-theme'
  use 'altercation/vim-colors-solarized'
  use 'dracula/vim'
  use 'joshdick/onedark.vim'
  use 'rakr/vim-one'
  use 'tomasiser/vim-code-dark'
  use 'tomasr/molokai'
  use 'lunarvim/darkplus.nvim'
  use 'giel/onedarker-giel.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
