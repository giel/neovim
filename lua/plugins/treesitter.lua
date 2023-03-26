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
      "c_sharp",
      "css",
      "go",
      "gomod",
      "hcl",
      "help",
      "html",
      "json",
      "lua",
      "markdown",
      "python",
      "query",
      "toml",
      "vim",
      "yaml",
    },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing for "all"
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
