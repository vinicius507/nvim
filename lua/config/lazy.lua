local function bootstrap()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
	end

	vim.opt.rtp:prepend(lazypath)
end

bootstrap()
require("lazy").setup({
	spec = {
		{
			"LazyVim/LazyVim",
			dir = vim.fs.normalize("~/Code/LazyVim/"),
			import = "lazyvim.plugins",
		},
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = "*",
	},
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})