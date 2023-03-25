return {
  "ahmedkhalf/project.nvim",
  commit = "1c2e9c93c7c85126c2197f5e770054f53b1926fb",
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

    telescope.load_extension("projects")
  end,
}
