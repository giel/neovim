-- https://github.com/echasnovski/mini.surround
return {
  "echasnovski/mini.surround",
  version = "*",
  opts = {
    -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
    highlight_duration = 1000,
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      add = "sa", -- Add surrounding in Normal and Visual modes
      delete = "sd", -- Delete surrounding
      find = "sf", -- Find surrounding (to the right)
      find_left = "sF", -- Find surrounding (to the left)
      highlight = "sh", -- Highlight surrounding
      replace = "sr", -- Replace surrounding
      update_n_lines = "sn", -- Update `n_lines`

      suffix_last = "l", -- Suffix to search with "prev" method
      suffix_next = "n", -- Suffix to search with "next" method
    },
  },
}

-- https://github.com/kylechui/nvim-surround
-- return {
--   "kylechui/nvim-surround",
--   version = "*", -- Use for stability; omit to use `main` branch for the latest features
--   config = function()
--     require("nvim-surround").setup({
--       -- Configuration here, or leave empty to use defaults
--     })
--   end,
-- }
--  :h nvim-surround.usage.
-- Usage:
--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
