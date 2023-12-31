-- https://github.com/norcalli/nvim-colorizer.lua
-- * colors the css hex values, like #FEDC56 or Red

return {

  "norcalli/nvim-colorizer.lua",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("colorizer").setup({ "*" }, {
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      -- names    = true; -- "Name" codes like Blue
    })
  end,
}
