local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback({
    'JetBrainsMono Nerd Font',
    'Fira Code',
    'Monaco',
  }),
  font_size = 12.0,
  color_scheme = 'Catppuccin Mocha',
  enable_tab_bar = false,
  window_background_opacity = 0.75,
  hide_mouse_cursor_when_typing = true,
  adjust_window_size_when_changing_font_size = false,
  check_for_updates = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
