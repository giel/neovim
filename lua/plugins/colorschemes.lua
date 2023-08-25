return {
  {
    "giel/onedarker-giel.nvim",
    -- make sure to load this befora all the other start plugins (50 = default)
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme onedarker-giel]])
    end,
  },
  -- some other nice schemes
  -- { "NLKNguyen/papercolor-theme" },
  -- { "altercation/vim-colors-solarized" },
  -- { "dracula/vim" },
  -- { "joshdick/onedark.vim" },
  -- { "rakr/vim-one" },
  -- { "tomasiser/vim-code-dark" },
  -- { "tomasr/molokai" },
  -- { "lunarvim/darkplus.nvim" },
}
