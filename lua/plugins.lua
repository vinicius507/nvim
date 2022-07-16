local packer = require("packer")

packer.startup({
	function()
		packer.use("wbthomason/packer.nvim")
		packer.use({
			"catppuccin/nvim",
			as = "catppuccin",
			event = "VimEnter",
			config = function()
				require("plugins.catppuccin")
			end,
		})
		packer.use({
			"feline-nvim/feline.nvim",
			after = "catppuccin",
			config = function()
				require("plugins.feline")
			end,
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		packer.use({
			"nvim-telescope/telescope.nvim",
			after = "catppuccin",
			config = function()
				require("plugins.telescope")
			end,
			requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim" },
		})
	end,
	config = {},
})

vim.cmd([[
	augroup packer_user_config
	  autocmd!
	  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end 
]])
