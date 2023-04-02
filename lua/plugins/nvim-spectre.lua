-- https://github.com/nvim-pack/nvim-spectre
-- search/replace in multiple files
return {
  "windwp/nvim-spectre",
  -- stylua: ignore
  keys = {
    { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
  },
}
