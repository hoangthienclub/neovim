local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
  window = {
    backdrop = 0.9,
    width = 120,
    height = 0.9,
  },
  plugins = {
    twilight = {enabled = false},
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
  }
}


