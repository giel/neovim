return {
  {
    "giel/onedarker-giel.nvim",
    -- "rebelot/kanagawa.nvim",

    -- make sure to load this befora all the other start plugins (50 = default)
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme onedarker-giel]])
      vim.cmd([[
      try
      colorscheme onedarker-giel
      " colorscheme kanagawa
      catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
        set background=dark
      endtry
      ]])
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
  -- { "rebelot/kanagawa.nvim" }
}
