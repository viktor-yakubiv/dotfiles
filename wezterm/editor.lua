local wezterm = require 'wezterm'
local merge_tables = require 'merge'
local append_table = require 'append'

local act = wezterm.action

local function exec(cmd)
	local args = { os.getenv 'SHELL', '-c' }
	merge_tables(args, { cmd })
	return args
end

local function create_editor_workspace(current_window, current_pane)
	local terminal_pane = current_pane
	local gui_window = current_window
	local mux_window = gui_window.mux_window

	-- mux_window:set_workspace 'editor'

	local editor_pane = terminal_pane:split { direction = 'Left', size = 0.6 }
	local build_pane = terminal_pane:split { direction = 'Top' }

	editor_pane:send_text('e' .. '\n')
	build_pane:send_text('serve' .. '\n')

	editor_pane:activate()
	gui_window:toggle_fullscreen()
	gui_window:perform_action(act.ActivateKeyTable {
		name = 'editor',
		one_shot = false,
	}, editor_pane)
end

local function apply_workspaces(config)
	if config.keys == nil then config.keys = {} end
	if config.key_tables == nil then config.key_tables = {} end

	append_table(config.keys, {
		{
			mods = 'CMD', key = 'e',
			action = act.EmitEvent 'open-editor'
		}
	})

	merge_tables(config.key_tables, {
		editor = {
			{
				mods = 'CMD', key = 'e',
				action = act.ActivatePaneByIndex(0), -- editor was created first
			},
			{
				mods = 'CMD', key = 't',
				action = act.ActivatePaneByIndex(2), -- terminal is the original pane
			},
			{
				mods = 'CMD', key = 'b',
				action = act.ActivatePaneByIndex(1), -- build pane was created second
			},
			{
				mods = 'CMD', key = 'w',
				action = act.CloseCurrentTab { confirm = true },
			},
			{
				mods = 'CMD', key = 'q',
				action = act.CloseCurrentTab { confirm = true },
			},
		},
	})

	wezterm.on('open-editor', create_editor_workspace)
end

return apply_workspaces
