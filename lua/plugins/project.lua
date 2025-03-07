-- https://github.com/ahmedkhalf/project.nvim
-- detect projects and show in telescope

return {
  "ahmedkhalf/project.nvim",
  enabled = true,
  dependencies = "nvim-telescope/telescope.nvim",

  config = function()
    require("project_nvim").setup({

      -- detection_methods = { "lsp", "pattern" },
      -- NOTE: lsp detection will get annoying with multiple langs in one project
      detection_methods = { "pattern" },

      -- patterns used to detect root dir, when **"pattern"** is in detection_methods
      patterns = { ".git", "Makefile", "package.json" },
    })

    local tele_status_ok, telescope = pcall(require, "telescope")
    if not tele_status_ok then
      return
    end

    -- call the api like this:
    -- local project_nvim = require("project_nvim")
    -- local recent_projects = project_nvim.get_recent_projects()
    -- print(vim.inspect(recent_projects))

    -- now telescope is needed
    telescope.load_extension("projects")
  end,
}
