-- https://github.com/nvim-treesitter/nvim-treesitter
-- syntax higlighting and more

local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.build = function()
  require("nvim-treesitter.install").update({ with_sync = true })
end

Plugin.config = function()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    ensure_installed = {
      "bash",
      "c",
      "c_sharp",
      "css",
      "go",
      "gomod",
      "hcl",
      "html",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
    },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing for "all"
    -- check this together with mason
    auto_install = true,
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        -- todo add to keymaps
        -- set to `false` to disable one of the mappings
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<TAB>",
        node_decremental = "<BS>",
      },
    },
  })

  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
  parser_configs.hcl = {
    filetype = "hcl",
    "terraform",
  }
end

return Plugin

-- Use `TSInstallInfo` to see available modules
-- Use `TSInstall` modulename to actually install modulename
-- TSInstall bash c_sharp css go gomod hcl html json lua markdown python toml yaml
