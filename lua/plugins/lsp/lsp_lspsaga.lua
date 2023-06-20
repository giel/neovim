-- Neovim lsp enhance plugin
-- https://github.com/nvimdev/lspsaga.nvim
return {
  "nvimdev/lspsaga.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    -- Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  -- config = true,
  config = function()
    require("lspsaga").setup({
      -- See Customizing Lspsaga's Appearance
      ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = "single",
        winblend = 0,
        expand = "",
        collapse = "",
        code_action = "💡",
        incoming = " ",
        outgoing = " ",
        hover = " ",
        kind = {},
      },
      -- symbol_in_winbar now shows in lualine
      symbol_in_winbar = {
        enable = false, -- 'path in code'-line on top
        separator = " ",
        ignore_patterns = {},
        hide_keyword = true,
        show_file = false,
        folder_level = 0,
        respect_root = false,
        color_mode = true,
      },
    })
  end,
}
