local wezterm = require("wezterm")

local config = {}

config.font = wezterm.font_with_fallback({
  "Iosevka",
  "Iosevka Nerd Font Mono",
})
config.font_size = 14
config.font_rules = {
  {
    italic = true,
    intensity = "Bold",
    font = wezterm.font_with_fallback({
      { family = "Iosevka Slab", italic = true },
      "Iosevka Nerd Font Mono",
    }),
  },
}

config.color_scheme = "lavi"

config.enable_scroll_bar = false

-- https://wezfurlong.org/wezterm/config/lua/config/hyperlink_rules.html

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
