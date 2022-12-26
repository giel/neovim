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

  -- LSP
  use { "neovim/nvim-lspconfig"            , commit = "a63d2c75c6880d45209baff596939343e8a431fd" } -- enable LSP
  use { "williamboman/mason.nvim",           commit = "61af398d5cf7129564bcd65e2622d21883b9321b" } -- * new
  use { "williamboman/mason-lspconfig.nvim", commit = "fc78caa46e306103818137759afcc908ab6be948" } -- * new

  use { "j-hui/fidget.nvim", commit = "44585a0c0085765195e6961c15529ba6c5a2a13b" } -- Useful status updates for LSP
  use { "folke/neodev.nvim", commit = "c5f0a814abf89b5b1e3cfed95322813939bdc0c5" }  -- Additional lua configuration, makes nvim stuff amazing

  use { "jose-elias-alvarez/null-ls.nvim"  , commit = "b26851b3e7ac1c0c85666f8a74e36aef2acb89c6" } -- for formatters and linters
  use { "RRethy/vim-illuminate"            , commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" } -- highlight word under curso
  -- use 'onsails/lspkind-nvim'
  -- use 'kosayoda/nvim-lightbulb'
  -- use 'mfussenegger/nvim-jdtls'

  -- cmp plugins
  use { "hrsh7th/nvim-cmp"          , commit = "d09b0c396aaa078cdfe78316ec06940971136e85" } -- The completion plugin
  use { "hrsh7th/cmp-buffer"        , commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path"          , commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "hrsh7th/cmp-cmdline"       , commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip"  , commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp"      , commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" } -- neovim's built-in language server client.
  use { "hrsh7th/cmp-nvim-lua"      , commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" } -- neovim Lua API.
  --
  -- snippets
  use { "L3MON4D3/LuaSnip"            , commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } -- snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- Treesitter syntax highlighting
  use {'nvim-treesitter/nvim-treesitter' , commit = "4bcd3a3cc31b9628a48ff126938262292b1ed988", run = ':TSUpdate'}
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  -- use 'nvim-treesitter/playground'
  -- use 'p00f/nvim-ts-rainbow'

  -- Telescope (a highly extendable fuzzy finder over lists)
  use {'nvim-telescope/telescope.nvim', commit = "e960efa60e97df58e089b00270f09d60f27202c8" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d" }
  -- use 'f-person/git-blame.nvim'
  -- use 'tpope/vim-fugitive'
  -- use 'tpope/vim-rhubarb'

  -- surround brackets, qoutes, tags: https://tpope.io/vim/surround.git
  -- and repeat to enable repeating surround commands: https://github.com/tpope/vim-repeat
  use { 'tpope/vim-surround' , commit = "3d188ed2113431cf8dac77be61b842acb64433d9" } -- *
  use { 'tpope/vim-repeat'   , commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" } -- *

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
  use { 'folke/which-key.nvim'        , commit = "8682d3003595017cd8ffb4c860a07576647cc6f8" }  -- cheetsheet for keys
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
