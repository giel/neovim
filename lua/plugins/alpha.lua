-- https://github.com/goolord/alpha-nvim"
-- startup menu

return {

  "goolord/alpha-nvim",
  -- commit = "3847d6baf74da61e57a13e071d8ca185f104dc96",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[    ██████  ██ ███████ ██      ██  ███████       ]],
      [[   ██       ██ ██      ██       █  ██            ]],
      [[   ██   ███ ██ █████   ██          ███████       ]],
      [[   ██    ██ ██ ██      ██               ██       ]],
      [[    ██████  ██ ███████ ███████     ███████       ]],
      [[                                                 ]],
      [[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
      [[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
      [[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
      [[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
      [[██   ████ ███████  ██████    ████   ██ ██      ██]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("e", " " .. " Explore files", ":Neotree toggle<CR>"),
      -- dashboard.button("e", " " .. " Explore files", ":NvimTreeToggle<CR>"),
      dashboard.button("c", " " .. " Config", ":e " .. vim.fn.stdpath("config") .. "/init.lua <CR>"),
      dashboard.button("v", " " .. " Neovim version", ":version<CR>"),
      dashboard.button("h", " " .. " Check health", ":checkhealth<CR>"),
      dashboard.button("l", " " .. " Lazy package manager", ":Lazy<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    local function footer()
      return ":Alpha - https://bitbucket.org/giel/neovim"
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    require("alpha").setup(dashboard.opts)
  end,
}