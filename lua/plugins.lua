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
  use { "wbthomason/packer.nvim"        , commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim"         , commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" } -- Useful lua functions used by lots of plugins
  use { "kyazdani42/nvim-web-devicons"  , commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" } -- web icons needed a lot (nvim-tree i.e.)
  use { "kyazdani42/nvim-tree.lua"      , commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" } -- File Explorer nvim-tree
  use { "moll/vim-bbye"                 , commit = "25ef93ac5a87526111f43e5110675032dbcacf56" } -- provide Bdelete function
  use { "ahmedkhalf/project.nvim"       , commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" } -- projects
  use { "akinsho/bufferline.nvim"       , commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" } -- Visual tabs for buffers!
  use { "nvim-lualine/lualine.nvim"     , commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" } -- Status Line
  use { 'godlygeek/tabular'             , commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a" } -- Tabular for aligning tables https://github.com/godlygeek/tabular
  use { "terrortylor/nvim-comment"      , commit = "861921706a39144ea528a6200a059a549b02d8f0" } -- commenter
  use { "lewis6991/impatient.nvim"      , commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" } -- Speed up loading Lua modules in Neovim
  use { "goolord/alpha-nvim"            , commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" } -- Splash screen

  -- Information
  use 'nanotee/nvim-lua-guide'  -- :help nvim-lua-guide

  -- Helper functions for nvim in lua
  -- use 'norcalli/nvim_utils'

  -- cmp plugins
  use { "hrsh7th/nvim-cmp"          , commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" } -- The completion plugin
  use { "hrsh7th/cmp-buffer"        , commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
  use { "hrsh7th/cmp-path"          , commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- path completions
  use { "hrsh7th/cmp-cmdline"       , commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip"  , commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp"      , commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua"      , commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- snippets
  use { "L3MON4D3/LuaSnip"            , commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } -- snippet engine
  use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig"            , commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" } -- enable LSP
  use { "williamboman/nvim-lsp-installer"  , commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { 'tamago324/nlsp-settings.nvim'     , commit = '527cdfef1b1eb47eb3e6e6f737575a710f307d3a' } -- language server settings defined in json for
  use { "jose-elias-alvarez/null-ls.nvim"  , commit = "ff40739e5be6581899b43385997e39eecdbf9465" } -- for formatters and linters
  use { "RRethy/vim-illuminate"            , commit = "c82e6d04f27a41d7fdcad9be0bce5bb59fcb78e5" } -- highlight word under curso
  -- use 'onsails/lspkind-nvim'
  -- use 'kosayoda/nvim-lightbulb'
  -- use 'mfussenegger/nvim-jdtls'

  -- Treesitter syntax highlighting
  use {'nvim-treesitter/nvim-treesitter' , commit = "518e27589c0463af15463c9d675c65e464efc2fe", run = ':TSUpdate'}
  -- use 'nvim-treesitter/nvim-treesitter-refactor'
  -- use 'nvim-treesitter/playground'
  -- use 'p00f/nvim-ts-rainbow'

  -- Telescope (a highly extendable fuzzy finder over lists)
  use {'nvim-telescope/telescope.nvim', commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" }

  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }
  -- use 'f-person/git-blame.nvim'
  -- use 'tpope/vim-fugitive'
  -- use 'tpope/vim-rhubarb'

  -- surround brackets, qoutes, tags: https://tpope.io/vim/surround.git
  -- and repeat to enable repeating surround commands: https://github.com/tpope/vim-repeat
  use { 'https://tpope.io/vim/surround.git'   , commit = "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea" }
  use { 'https://github.com/tpope/vim-repeat' , commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" }

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

  use { 'norcalli/nvim-colorizer.lua' , commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" }  -- colors the css hex values
  use { 'folke/which-key.nvim'        , commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71" }  -- cheetsheet for keys
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
