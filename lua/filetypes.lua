# filetype related code

vim.filetype.add({
  extension = {
    arch = "arch-wiki",
    ocl = "hcl", -- Treat .ocl files as HCL
  },
  filename = {
    ["starship.toml.tmpl"] = "toml",
  },
  pattern = {
    ["README.(a+)$"] = function(path, bufnr, ext)
      if ext == "md" then
        return "markdown"
      elseif ext == "rst" then
        return "rst"
      end
    end,
  },
})

-- In chezemoi .tmpl is added to a file which confuses filetype discovery.
-- Use the extension before .tmpl for the filetype
local function set_dynamic_filetype()
  local filename = vim.fn.expand("%:t") -- Get the current file name
  local ext = filename:match("^(.*)%.tmpl$") -- Extract 'ext' from '*.ext.tmpl'
  if ext then
    local ft = ext:match("^.+%.(.*)$") -- Further extract if 'ext' contains another '.'
    if ft then
      vim.bo.filetype = ft -- Set the filetype to 'ext'
    end
  end
end

-- Create an autocommand that calls the above function for files matching '*.tmpl'
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tmpl",
  callback = set_dynamic_filetype,
})
