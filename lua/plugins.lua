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
    use 'wbthomason/packer.nvim'

    -- Information
    use 'nanotee/nvim-lua-guide'  -- :help nvim-lua-guide

    -- Helper functions for nvim in lua
    use 'norcalli/nvim_utils'

    -- cmp plugins
    use "hrsh7th/nvim-cmp"         -- The completion plugin
    use "hrsh7th/cmp-buffer"       -- buffer completions
    use "hrsh7th/cmp-path"         -- path completions
    use "hrsh7th/cmp-cmdline"      -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- snippets
    use "L3MON4D3/LuaSnip"             -- snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
    use 'tamago324/nlsp-settings.nvim'    -- language server settings defined in json for
    use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

--    use 'nvim-lua/completion-nvim'
--    use 'anott03/nvim-lspinstall'
--    use 'kabouzeid/nvim-lspinstall'
--    use 'glepnir/lspsaga.nvim'

     use 'moll/vim-bbye'   -- provide Bdelete function

    -- use 'onsails/lspkind-nvim'
    -- use 'kosayoda/nvim-lightbulb'
    -- use 'mfussenegger/nvim-jdtls'

    -- Treesitter syntax highlighting
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'

    -- Visual tabs for buffers!
    use {'akinsho/nvim-bufferline.lua' , requires = {'kyazdani42/nvim-web-devicons'} }

    -- Status Line
    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'} }

    -- Telescope (a highly extendable fuzzy finder over lists)
    use {'nvim-telescope/telescope.nvim', requires = {
             {'nvim-lua/popup.nvim'},
             {'nvim-lua/plenary.nvim'}
         }
    }
    -- use 'nvim-telescope/telescope-media-files.nvim'

    -- File Explorer nvim-tree
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} }

    -- Git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
    -- use 'f-person/git-blame.nvim'
    use 'tpope/vim-fugitive'
    -- use 'tpope/vim-rhubarb'

    -- Tabular for aligning tables https://github.com/godlygeek/tabular
    use 'godlygeek/tabular'

    -- commenter
    --use "terrortylor/nvim-comment" require('nvim_comment').setup() --werkt
    use "terrortylor/nvim-comment" -- require('nvim_comment')
    --werkt niet: use {"terrortylor/nvim-comment" , requires = {'terrortylor/nvim_comment'} }

    -- surround brackets, qoutes, tags: https://tpope.io/vim/surround.git
    -- and repeat to enable repeating surround commands: https://github.com/tpope/vim-repeat
    use 'https://tpope.io/vim/surround.git'
    use 'https://github.com/tpope/vim-repeat'

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

    -- colors the css hex values
    use 'norcalli/nvim-colorizer.lua'

    -- cheetsheet for keys
    use 'folke/which-key.nvim'

    -- cheesheet for cheetsheet.txt
    use { 'sudormrfbin/cheatsheet.nvim', requires = {
              {'nvim-telescope/telescope.nvim'},
              {'nvim-lua/popup.nvim'},
              {'nvim-lua/plenary.nvim'},
           }
        }

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
