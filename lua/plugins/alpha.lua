-- https://github.com/goolord/alpha-nvim"
-- startup menu

return {

  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  enabled = true,
  lazy = false,
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      -- [[    ██████  ██ ███████ ██      ██  ███████       ]],
      -- [[   ██       ██ ██      ██       █  ██            ]],
      -- [[   ██   ███ ██ █████   ██          ███████       ]],
      -- [[   ██    ██ ██ ██      ██               ██       ]],
      -- [[    ██████  ██ ███████ ███████     ███████       ]],
      [[Giel's]],
      [[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
      [[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
      [[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
      [[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
      [[██   ████ ███████  ██████    ████   ██ ██      ██]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("e", " " .. " Explore files", ":Neotree toggle<CR>"),
      -- dashboard.button("e", " " .. " Explore files", function()
      --   Snacks.explorer()
      -- end),
      dashboard.button("c", " " .. " Config", ":e " .. vim.fn.stdpath("config") .. "/init.lua <CR>"),
      dashboard.button("v", " " .. " Neovim version", ":version<CR>"),
      dashboard.button("h", "󰋠 " .. " Check health", ":checkhealth<CR>"),
      dashboard.button("l", " " .. " Lazy package manager", ":Lazy<CR>"),
      dashboard.button("m", " " .. " Mason package manager", ":Mason<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    function insertButton(button)
      table.insert(dashboard.section.buttons.val, 2, button)
    end

    insertButton(dashboard.button("p", " " .. " Find project", ":FzfProjects<CR>"))
    insertButton(dashboard.button("f", " " .. " Find file", ":FzfLua files <CR>"))
    insertButton(dashboard.button("r", " " .. " Recent files", ":FzfLua oldfiles <CR>"))
    insertButton(dashboard.button("t", " " .. " Find text", ":FzfLua live_grep <CR>"))

    local function footer()
      return ":Alpha - https://github.com/giel/neovim.git"
    end
    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.opts.opts.noautocmd = true

    require("alpha").setup(dashboard.opts)
  end,
}
