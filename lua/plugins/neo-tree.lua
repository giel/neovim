-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- Neo-tree is a Neovim plugin to browse the file system and other tree like structures
-- in whatever style suits you, including sidebars, floating windows, netrw split style,
-- or all of them at once!
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  -- no lazy loading to allow opening directories from shell commandline
  config = function()
    require("neo-tree").setup({
      sort_case_insensitive = true, -- used when sorting files and directories in the tree
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        -- "document_symbols",
      },
      filesystem = {
        follow_current_file = { enabled = true }, -- This will find and focus the file in the active buffer every
        hijack_netrw_behaviour = "open_default",
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = false,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
            --"node_modules",
          },
          hide_by_pattern = {
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            ".config",
            ".editorconfig",
            ".gitattributes",
            ".github",
            ".gitignore",
            ".obsidian",
            ".octopus",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
      },
      buffers = { follow_current_file = { enabled = true } }, -- This will find and focus the file in the active buffer every

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
