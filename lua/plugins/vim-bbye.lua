-- https://github.com/moll/vim-bbye
-- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
return {
  "moll/vim-bbye", -- provide Bdelete function (instead of vim's bdelete)
  -- disable bufdelete if this one is enabled
  enabled = false,
}
