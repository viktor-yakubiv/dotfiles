local wezterm = require 'wezterm'

local function get_current_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Dark'
end

local function auto_color_scheme(schemes)
	local appearance = get_current_appearance()
	return schemes[appearance]
end

local config = {
	font = wezterm.font_with_fallback {
		{
			family = 'Monaspace Neon',
			harfbuzz_features = { -- are not enabled by default
				'calt', -- texture healing
				'liga', -- repeating character sets
				'ss01', -- === and ==
				'ss02', -- => and <=>
				'ss03', -- ->
				'ss04', -- </ and />
				'ss05', -- [| and |>
				'ss06', -- ### and +++
				'ss07', -- :: and :::
				'ss08', -- ..= and .=
			},
		},
		'Cascadia Code', -- fallback for Cyrillic
		'Source Code Pro',
		'Fira Code',
		-- 'Apple Color Emoji',
	},

	font_size = 14,
	line_height = 1.35,

	color_scheme = auto_color_scheme {
		Dark = 'Catppuccin Mocha',
		Light = 'Catppuccin Latte',
	},

	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	native_macos_fullscreen_mode = true,
}

return config
