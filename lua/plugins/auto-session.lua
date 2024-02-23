-- https://github.com/rmagatti/auto-session
-- automatiacally save your session and open it when you open nvim from the same directory.
return {
  "rmagatti/auto-session",
  enabled = false, -- seems to clash with alpha startscreen
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
    })
  end,
}
