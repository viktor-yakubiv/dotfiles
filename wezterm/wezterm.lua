local wezterm = require 'wezterm'
local merge_tables = require 'merge'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Global TERM environment variable
-- 'wezterm' value causes the backspace key work inappropriately
-- config.term = 'wezterm'
config.term = 'xterm-256color'

merge_tables(config, require 'appearance')
merge_tables(config, require 'keys')

-- Workspaces
require 'editor' (config)

return config
