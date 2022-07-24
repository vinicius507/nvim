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
			config = function()
				require("plugins.treesitter")
			end,
			requires = {
				"nvim-treesitter/nvim-treesitter-textobjects",
				"nvim-treesitter/nvim-treesitter-refactor",
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
		packer.use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("plugins.cmp")
			end,
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"onsails/lspkind.nvim",
			},
		})
		packer.use({
			"akinsho/toggleterm.nvim",
			after = "catppuccin",
			config = function()
				require("plugins.toggleterm")
			end,
		})
		packer.use({
			"kylechui/nvim-surround",
			event = { "BufReadPost", "BufNewFile" },
			config = function()
				require("nvim-surround").setup()
			end,
		})
		packer.use({
			"numToStr/Comment.nvim",
			event = { "BufReadPost", "BufNewFile" },
			config = function()
				require("plugins.comment")
			end,
		})
		packer.use({
			"TimUntersberger/neogit",
			config = function()
				require("plugins.neogit")
			end,
			requires = { "nvim-lua/plenary.nvim" },
		})
		packer.use({
			"romgrk/barbar.nvim",
			after = "catppuccin",
			config = function()
				require("plugins.barbar")
			end,
			requires = { "kyazdani42/nvim-web-devicons" },
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
