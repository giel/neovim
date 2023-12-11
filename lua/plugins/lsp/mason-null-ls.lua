-- https://github.com/jay-babu/mason-null-ls.nvim
-- mason-null-ls bridges mason.nvim with the null-ls plugin
-- - making it easier to use both plugins together.
return {
  "jay-babu/mason-null-ls.nvim",
  enabled = true,
  opts = {
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
  },
}
