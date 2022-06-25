-- https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
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
}

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.hcl = {
  filetype = "hcl", "terraform",
}

-- Use `TSInstallInfo` to see available modules
-- Use `TSInstall` modulename to actually install modulename
-- TSInstall bash c_sharp css go gomod hcl html json lua markdown python toml yaml
