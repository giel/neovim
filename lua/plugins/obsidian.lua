-- https://github.com/epwalsh/obsidian.nvim
-- A Neovim plugin for writing and navigating Obsidian vaults, written in Lua.
return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  enabled = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "vulpennen",
        path = function()
          local git = os.getenv("GITPATH") .. "/"
          return assert(git .. "vulpennen")
        end,
      },
      {
        name = "bloghg",
        path = function()
          local git = os.getenv("GITPATH") .. "/"
          return assert(git .. "bloghg")
        end,
      },
    },
    {
      name = "no-vault",
      path = function()
        -- alternatively use the CWD:
        -- return assert(vim.fn.getcwd())
        return assert(vim.fs.dirname(vim.api.nvim_buf_get_name(0)))
      end,
      overrides = {
        notes_subdir = vim.NIL, -- have to use 'vim.NIL' instead of 'nil'
        new_notes_location = "current_dir",
        templates = {
          subdir = vim.NIL,
        },
        disable_frontmatter = true,
      },
    },
  },
}
