local api = vim.api
local fn = vim.fn

-- The root dir to install all plugins.
-- Plugins are under opt/ or start/ sub-directory.
vim.g.plugin_home = fn.stdpath('data') .. '/site/pack/packer'

--- Install packer if it has not been installed.
--- Return:
---   true: if this is a fresh install of packer
---   false: if packer has been installed
local function install_packer()
	-- Where to install packer.nvim -- the package manager (we make it opt)
	local packer_dir = vim.g.plugin_home .. '/opt/packer.nvim'

	if fn.glob(packer_dir) ~= '' then
		return false
	end

	-- Auto-install packer in case it hasn't been installed.
	api.nvim_echo({ { 'Installing packer.nvim', 'Type' } }, true, {})

	local packer_repo = 'https://github.com/wbthomason/packer.nvim'
	local install_cmd = string.format('!git clone --depth=1 %s %s', packer_repo, packer_dir)
	vim.cmd(install_cmd)

	return true
end

local fresh_install = install_packer()

-- Load packer.nvim
vim.cmd('packadd packer.nvim')

local packer = require('packer')
local packer_util = require('packer.util')


packer.startup {
	function(use)
		-- it is recommended to put impatient.nvim before any other plugins
		-- it speeds up loading other lua plugins
		use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

		-- manage itself
		use { 'wbthomason/packer.nvim', opt = true }

		use 'gpanders/editorconfig.nvim'
	end,

	config = {
		max_jobs = 16,
		compile_path = packer_util.join_paths(fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
	},
}

-- For fresh install, we need to install plugins.
-- Otherwise, we just need to require `packer_compiled.lua`.
if fresh_install then
	-- We run packer.sync() here,
	-- as we can only know after startup, which plugins to install.
	packer.sync()
else
	local status, _ = pcall(require, "packer_compiled")
	if not status then
		local msg = "File packer_compiled.lua not found: run PackerSync to fix!"
		vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })
	end
end

-- Auto-generate packer_compiled.lua file
api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*/nvim/lua/plugins.lua",
	group = api.nvim_create_augroup("packer_auto_compile", { clear = true }),
	callback = function(ctx)
		local cmd = "source " .. ctx.file
		vim.cmd(cmd)
		vim.cmd("PackerCompile")
		vim.notify("PackerCompile done!", vim.log.levels.INFO, { title = "Nvim-config" })
	end,
})
