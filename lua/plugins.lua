return {


{ "nvim-lua/plenary.nvim"         , commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }, -- Useful lua functions used by lots of plugins
{ "kyazdani42/nvim-web-devicons"  , commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622" }, -- web icons needed a lot (nvim-tree i.e.)
--{ "kyazdani42/nvim-tree.lua"      , commit = "e14989c0eaa6f9c299d48f7e45ce1ed04b21180f" }, -- File Explorer nvim-tree
{ "moll/vim-bbye"                 , commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }, -- provide Bdelete function
{ "ahmedkhalf/project.nvim"       , commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" }, -- projects
-- { "akinsho/bufferline.nvim"       , commit = "4ecfa81e470a589e74adcde3d5bb1727dd407363" }, -- Visual tabs for buffers!
-- { "nvim-lualine/lualine.nvim"     , commit = "bfa0d99ba6f98d077dd91779841f1c88b7b5c165" }, -- Status Line
{ 'godlygeek/tabular'             , commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a" }, -- * Tabular for aligning tables https://github.com/godlygeek/tabular
{ "terrortylor/nvim-comment"      , commit = "e9ac16ab056695cad6461173693069ec070d2b23" }, -- * commenter
{ "lewis6991/impatient.nvim"      , commit = "9f7eed8133d62457f7ad2ca250eb9b837a4adeb7" }, -- Speed up loading Lua modules in Neovim

-- Information
{'nanotee/nvim-lua-guide' },  -- :help nvim-lua-guide

  -- Helper functions for nvim in lua
  -- {'norcalli/nvim_utils'},

-- LSP
{ "neovim/nvim-lspconfig"            , commit = "a63d2c75c6880d45209baff596939343e8a431fd" }, -- enable LSP
{ "williamboman/mason.nvim",           commit = "61af398d5cf7129564bcd65e2622d21883b9321b" }, -- * new
{ "williamboman/mason-lspconfig.nvim", commit = "fc78caa46e306103818137759afcc908ab6be948" }, -- * new

{ "j-hui/fidget.nvim", commit = "44585a0c0085765195e6961c15529ba6c5a2a13b" }, -- Useful status updates for LSP
{ "folke/neodev.nvim", commit = "c5f0a814abf89b5b1e3cfed95322813939bdc0c5" },  -- Additional lua configuration, makes nvim stuff amazing
{ "jose-elias-alvarez/null-ls.nvim"  , commit = "b26851b3e7ac1c0c85666f8a74e36aef2acb89c6" }, -- for formatters and linters
{ "RRethy/vim-illuminate"            , commit = "a6d0b28ea7d6b9d139374be1f94a16bd120fcda3" }, -- highlight word under curso
  
-- {'onsails/lspkind-nvim'},
-- {'kosayoda/nvim-lightbulb'},
-- {'mfussenegger/nvim-jdtls'},

-- cmp plugins
{ "hrsh7th/nvim-cmp"          , commit = "d09b0c396aaa078cdfe78316ec06940971136e85" }, -- The completion plugin
{ "hrsh7th/cmp-buffer"        , commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
{ "hrsh7th/cmp-path"          , commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
{ "hrsh7th/cmp-cmdline"       , commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063" }, -- cmdline completions
{ "saadparwaiz1/cmp_luasnip"  , commit = "18095520391186d634a0045dacaa346291096566" }, -- snippet completions
{ "hrsh7th/cmp-nvim-lsp"      , commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" }, -- neovim's built-in language server client.
{ "hrsh7th/cmp-nvim-lua"      , commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }, -- neovim Lua API.
--
-- snippets
{ "L3MON4D3/LuaSnip"            , commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }, -- snippet engine
{ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }, -- a bunch of snippets to use

-- Treesitter syntax highlighting
{'nvim-treesitter/nvim-treesitter' , commit = "4bcd3a3cc31b9628a48ff126938262292b1ed988", run = ':TSUpdate'},
-- {'nvim-treesitter/nvim-treesitter-refactor'},
-- {'nvim-treesitter/playground'},
-- {'p00f/nvim-ts-rainbow'},

-- Telescope (a highly extendable fuzzy finder over lists)
-- {'nvim-telescope/telescope.nvim', commit = "e960efa60e97df58e089b00270f09d60f27202c8" },

-- Git
{ "lewis6991/gitsigns.nvim", commit = "2ab3bdf0a40bab53033048c6be75bda86316b55d" },
-- {'f-person/git-blame.nvim'},
-- {'tpope/vim-fugitive'},
-- {'tpope/vim-rhubarb'},

-- surround brackets, qoutes, tags: https://tpope.io/vim/surround.git
-- and repeat to enable repeating surround commands: https://github.com/tpope/vim-repeat
{ 'tpope/vim-surround' , commit = "3d188ed2113431cf8dac77be61b842acb64433d9" }, -- *
{ 'tpope/vim-repeat'   , commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" }, -- *

-- another simple surround plugin. https://github.com/ur4ltz/surround.nvim
-- {
--   "ur4ltz/surround.nvim",
--   config = function()
--     require"surround".setup {mappings_style = "sandwich"}
--   end
-- }
-- another surround: https://github.com/echasnovski/mini.nvim#minisurround
-- other surround plugin.
-- https://github.com/machakann/vim-sandwich

{ 'norcalli/nvim-colorizer.lua' , commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" },  -- * colors the css hex values
-- { 'folke/which-key.nvim'        , commit = "8682d3003595017cd8ffb4c860a07576647cc6f8" },  -- cheetsheet for keys
{ 'sudormrfbin/cheatsheet.nvim' , commit = "9716f9aaa94dd1fd6ce59b5aae0e5f25e2a463ef" },  -- cheesheet for cheetsheet.txt

-- colorschemes
{'NLKNguyen/papercolor-theme'},
{'altercation/vim-colors-solarized'},
{'dracula/vim'},
{'joshdick/onedark.vim'},
{'rakr/vim-one'},
{'tomasiser/vim-code-dark'},
{'tomasr/molokai'},
{'lunarvim/darkplus.nvim'},
{'giel/onedarker-giel.nvim'},

}
