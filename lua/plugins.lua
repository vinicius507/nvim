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
			"folke/which-key.nvim",
			after = "catppuccin",
			config = function()
				require("plugins.whichkey")
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
		packer.use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			event = { "BufReadPost", "BufNewFile" },
			config = function()
				require("plugins.treesitter")
			end,
			requires = {
				{ "nvim-treesitter/nvim-treesitter-textobjects", module = "nvim-treesitter" },
				{ "nvim-treesitter/nvim-treesitter-refactor", module = "nvim-treesitter" },
			},
		})
		packer.use({
			"jose-elias-alvarez/null-ls.nvim",
			after = "nvim-treesitter",
			config = function()
				require("plugins.lsp.null-ls")
			end,
			requires = { "nvim-lua/plenary.nvim" },
		})
		packer.use({
			"neovim/nvim-lspconfig",
			after = "nvim-treesitter",
			config = function()
				require("plugins.lsp.lspconfig")
			end,
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
