local wezterm = require 'wezterm'
local append_table = require 'append'

local config = { keys = {} }
local act = wezterm.action

-- On MacOS, I got used to iTerms key binding for splitting panes.
if wezterm.target_triple:find '-darwin' then
	append_table(config.keys, {
		{
			mods = 'CTRL|CMD', key = 'f',
			action = act.ToggleFullScreen
		},
		{
			mods = 'CMD', key = 'd',
			action = act.SplitHorizontal
		},
		{
			mods = 'CMD|SHIFT', key = 'd',
			action = act.SplitVertical
		},
		{
			mods = 'CMD', key = 'w',
			action = act.CloseCurrentPane { confirm = true },
		},
	})
end

return config
