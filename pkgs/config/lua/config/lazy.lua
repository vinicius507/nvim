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

local lazy = require("lazy")
local lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json"
if vim.env.NVIM_FROM_STORE then
	lockfile = vim.fn.stdpath("state") .. "/lazy-lock.json"
end

lazy.setup({
	spec = {
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
		},

		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.editor.mini-files" },
		{ import = "lazyvim.plugins.extras.ui.edgy" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "plugins" },
		{
			"vinicius507/42Lazy",
			import = "ft-lazy.plugins",
			opts = {
				header = {
					login = "vgoncalv",
					email = "vgoncalv@student.42sp.org.br",
				},
			},
		},
	},
	defaults = { lazy = false },
	checker = { enabled = true },
	lockfile = lockfile,
	performance = {
		reset_packpath = false,
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
lazy.restore()
