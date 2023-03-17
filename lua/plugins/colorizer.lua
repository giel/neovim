-- https://github.com/norcalli/nvim-colorizer.lua
 -- * colors the css hex values, like #FEDC56 or Red


return {

'norcalli/nvim-colorizer.lua',
commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" ,

config = function()
  require("colorizer").setup(
  { '*'; },
  {
    RGB      = true; -- #RGB hex codes
    RRGGBB   = true; -- #RRGGBB hex codes
    RRGGBBAA = true; -- #RRGGBBAA hex codes
    rgb_fn   = true; -- CSS rgb() and rgba() functions
    hsl_fn   = true; -- CSS hsl() and hsla() functions
    css      = true; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = true; -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- names    = true; -- "Name" codes like Blue
  })
end

}
