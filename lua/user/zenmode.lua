
local zenmode = require("zen-mode")

zenmode.setup {
  window = {
    backdrop = 0.9,
    width = 120,
    height = 0.9,
    options = {signcolumn = "no", number = false, cursorline = false}
  },
  plugins = {
    options = {enabled = true, ruler = false, showcmd = false},
    twilight = {enabled = true},
    gitsigns = {enabled = false},
    tmux = {enabled = false}
  }
}
