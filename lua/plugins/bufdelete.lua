-- https://github.com/famiu/bufdelete.nvim
-- bufdelete allows you to do delete buffers (close files) without closing your windows or messing up your layout.
return {
  "famiu/bufdelete.nvim", -- provide Bdelete function (instead of vim's bdelete)
  -- disable vim-bbye if this one is enabled
  enabled = true,
}
