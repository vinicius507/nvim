local packer = require("packer")

packer.reset()
packer.init()

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
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"tami5/sqlite.lua",
	},
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
		require("plugins.null-ls")
	end,
	requires = { "nvim-lua/plenary.nvim" },
})
packer.use({
	"VonHeikemen/lsp-zero.nvim",
	config = function()
		require("plugins.lsp")
	end,
	requires = {
		-- Lsp
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Completion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
	},
})
packer.use({
	"L3MON4D3/LuaSnip",
	config = function()
		require("plugins.luasnip")
	end,
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
packer.use({
	"ahmedkhalf/project.nvim",
	after = "telescope.nvim",
	config = function()
		require("plugins.project")
	end,
})
packer.use({
	"Pocco81/true-zen.nvim",
	event = "VimEnter",
	config = function()
		require("plugins.zen")
	end,
})
packer.use({
	"lewis6991/gitsigns.nvim",
	event = "VimEnter",
	config = function()
		require("plugins.gitsigns")
	end,
})
packer.use({
	"kyazdani42/nvim-tree.lua",
	event = "VimEnter",
	requires = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("plugins.nvimtree")
	end,
})
packer.use({
	"klen/nvim-config-local",
	config = function()
		require("plugins.config-local")
	end,
})

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])
