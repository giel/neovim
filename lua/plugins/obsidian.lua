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
        overrides = {
          notes_subdir = "content/article",
          note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
              -- If title is given, transform it into valid file name.
              suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
              -- If title is nil, just add 4 random uppercase letters to the suffix.
              for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
              end
            end
            return suffix
          end,
          daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "content/post/" .. os.date("%Y"),
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%Y%m%d",
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%d-%m-%Y",
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = nil,
          },
        },
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
