local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
	'Monaspace Neon',
	'Cascadia Code',
	'Source Code Pro',
	-- 'Fira Code',
	-- 'Apple Color Emoji',
}

config.font_size = 14
config.line_height = 1.35

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Dark'
end

local function scheme_for_appearance(appearance)
	if appearance:find 'Dark' then
		return 'Catppuccin Mocha'
	end
	return 'Catppuccin Latte'
end

-- 'wezterm' value causes the backspace key work inappropriately
-- config.term = 'wezterm'
config.term = 'xterm-256color'

--- Appearance
config.color_scheme = scheme_for_appearance(get_appearance())
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = true

--- Key bindings
config.keys = {}
if wezterm.target_triple:find '-darwin' then
	table.insert(config.keys, {
		key = 'f',
		mods = 'CTRL|CMD',
		action = wezterm.action.ToggleFullScreen
	})
	table.insert(config.keys, {
		key = 'd',
		mods = 'CMD',
		action = wezterm.action.SplitHorizontal,
	})
	table.insert(config.keys, {
		key = 'd',
		mods = 'CMD|SHIFT',
		action = wezterm.action.SplitVertical,
	})
end

return config
