-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures
-- in whatever style suits you, including sidebars, floating windows, netrw split style, 
-- or all of them at once!
return
{
  "nvim-neo-tree/neo-tree.nvim",
  commit = "205184aa0e0f08e8a1249d9bb37b45bae85f01b9", 
  enabled = false,
  dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
   } ,
    config = function()
      require("neo-tree").setup()
    end,
}