local fn = vim.fn
local cmd = vim.cmd

local ok, packer
ok, _ = pcall(cmd, 'packadd packer.nvim')

if not ok then
	local packer_path = fn.stdpath('data')
		.. '/site/pack/packer/start/packer.nvim'

	print('Cloning packer..')
	fn.delete(packer_path, 'rf')
	fn.system({
		'git',
		'clone',
		'https://github.com/wbthomason/packer.nvim',
		'--depth',
		'20',
		packer_path,
	})

	cmd('packadd packer.nvim')
	ok, packer = pcall(require, 'packer')

	if ok then
		print('Packer cloned successfully.')
	else
		error("Couldn't clone packer !\nPacker path: " .. packer_path)
	end
else
	ok, packer = pcall(require, 'packer')
end

return packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end,
	},
	git = {
		clone_timeout = 600,
	},
	auto_clean = true,
	compile_on_sync = true,
})
