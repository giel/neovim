-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures
-- in whatever style suits you, including sidebars, floating windows, netrw split style,
-- or all of them at once!
return {
  "nvim-neo-tree/neo-tree.nvim",
  -- commit = "205184aa0e0f08e8a1249d9bb37b45bae85f01b9",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        -- "document_symbols",
      },
      filesystem = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
      },
      buffers = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
      },
      -- icons needed for nerd font v3 users, which probably is configured
      default_component_configs = {
        icon = {
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            renamed = "󰁕",
            unstaged = "󰄱",
          },
        },
      },
      -- Add this section only if you've configured source selector.
      source_selector = {
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
      },
    })
  end,
}
