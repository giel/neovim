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
  use { "wbthomason/packer.nvim"        , commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim"         , commit = "253d34830709d690f013daf2853a9d21ad7accab" } -- Useful lua functions used by lots of plugins
  use { "nvim-tree/nvim-web-devicons"   , commit = "585dbc29315ca60be67d18ae6175771c3fb6791e" } -- web icons needed a lot (nvim-tree i.e.)
  use { "nvim-tree/nvim-tree.lua"       , commit = "1d79a64a88af47ddbb55f4805ab537d11d5b908e" } -- File Explorer nvim-tree
  use { "moll/vim-bbye"                 , commit = "25ef93ac5a87526111f43e5110675032dbcacf56" } -- provide Bdelete function
  use { "ahmedkhalf/project.nvim"       , commit = "1c2e9c93c7c85126c2197f5e770054f53b1926fb" } -- projects
  use { "akinsho/bufferline.nvim"       , commit = "3677aceb9a72630b0613e56516c8f7151b86f95c" } -- Visual tabs for buffers!
  use { "nvim-lualine/lualine.nvim"     , commit = "e99d733e0213ceb8f548ae6551b04ae32e590c80" } -- Status Line
  use { 'godlygeek/tabular'             , commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a" } -- * Tabular for aligning tables https://github.com/godlygeek/tabular
  use { "terrortylor/nvim-comment"      , commit = "e9ac16ab056695cad6461173693069ec070d2b23" } -- * commenter
  use { "lewis6991/impatient.nvim"      , commit = "c90e273f7b8c50a02f956c24ce4804a47f18162e" } -- Speed up loading Lua modules in Neovim
  use { "goolord/alpha-nvim"            , commit = "3847d6baf74da61e57a13e071d8ca185f104dc96" } -- Splash screen

  -- Information
  use 'nanotee/nvim-lua-guide'  -- :help nvim-lua-guide

  -- Helper functions for nvim in lua
  -- use 'norcalli/nvim_utils'

  -- LSP
  use { "neovim/nvim-lspconfig"            , commit = "4deb72306a59b1a36e571f9d86d6c5a05b20b294" } -- enable LSP
  use { "williamboman/mason.nvim",           commit = "080cccf82b874df2898f73dcdb09b285a0824334" } -- * new
  use { "williamboman/mason-lspconfig.nvim", commit = "d1a76a59371813d16b5ef0deab209b85db5d19cd" } -- * new

  use { "j-hui/fidget.nvim", commit = "688b4fec4517650e29c3e63cfbb6e498b3112ba1" } -- Useful status updates for LSP
  use { "folke/neodev.nvim", commit = "adc448c982b64d92d52d2182b52f9c980c3020d5" }  -- Additional lua configuration, makes nvim stuff amazing

  use { "jose-elias-alvarez/null-ls.nvim"  , commit = "4bcf2701ae8fb9fd44e65acb4238cdca1f3bd04b" } -- for formatters and linters
  use { "RRethy/vim-illuminate"            , commit = "49062ab1dd8fec91833a69f0a1344223dd59d643" } -- highlight word under curso
  -- use 'onsails/lspkind-nvim'
  -- use 'kosayoda/nvim-lightbulb'
  -- use 'mfussenegger/nvim-jdtls'

  -- cmp plugins
  use { "hrsh7th/nvim-cmp"          , commit = "777450fd0ae289463a14481673e26246b5e38bf2" } -- The completion plugin
  use { "hrsh7th/cmp-buffer"        , commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path"          , commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "hrsh7th/cmp-cmdline"       , commit = "8fcc934a52af96120fe26358985c10c035984b53" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip"  , commit = "18095520391186d634a0045dacaa346291096566" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp"      , commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" } -- neovim's built-in language server client.
  use { "hrsh7th/cmp-nvim-lua"      , commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6" } -- neovim Lua API.
  --
  -- snippets
  use { "L3MON4D3/LuaSnip"            , commit = "a835e3d680c5940b61780c6af07885db95382478" } -- snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2f5b8a41659a19bd602497a35da8d81f1e88f6d9" } -- a bunch of snippets to use

  -- Treesitter syntax highlighting
  use {'nvim-treesitter/nvim-treesitter' , commit = "dcb9a89ab4f0091bf87aed4e6801423d3667f76a", run = ':TSUpdate'}
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  -- use 'nvim-treesitter/playground'
  -- use 'p00f/nvim-ts-rainbow'

  -- Telescope (a highly extendable fuzzy finder over lists)
  use {'nvim-telescope/telescope.nvim', commit = "a3f17d3baf70df58b9d3544ea30abe52a7a832c2" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "b1f9cf7c5c5639c006c937fc1819e09f358210fc" }
  -- use 'f-person/git-blame.nvim'
  -- use 'tpope/vim-fugitive'
  -- use 'tpope/vim-rhubarb'

  -- surround brackets, qoutes, tags: https://tpope.io/vim/surround.git
  -- and repeat to enable repeating surround commands: https://github.com/tpope/vim-repeat
  -- use { 'tpope/vim-surround' , commit = "3d188ed2113431cf8dac77be61b842acb64433d9" } -- *
  use { 'tpope/vim-repeat'   , commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" } -- *


  use { 'kylechui/nvim-surround',
         tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      }

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
  use { 'folke/which-key.nvim'        , commit = "fb027738340502b556c3f43051f113bcaa7e8e63" }  -- cheetsheet for keys
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
