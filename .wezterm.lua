-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 170
config.initial_rows = 40

-- or, changing the font size and color scheme.
--config.font_size = 10
--config.color_scheme = 'AdventureTime'

-- Finally, return the configuration to wezterm:
config.keys = {
    -- disable wezterm bindings for shift + ctrl + direction
    { key = "LeftArrow", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment, },
    { key = "RightArrow", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment, },
    { key = "UpArrow", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment, },
    { key = "DownArrow", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment, },
    { key = "a", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment, },
    { key = "x", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment, },
}

return config
