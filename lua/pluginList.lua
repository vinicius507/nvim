local ok, _ = pcall(require, 'packerInit')
local packer

if ok then
	packer = require('packer')
else
	return false
end

local cmd = vim.cmd

cmd('autocmd BufWritePost pluginList.lua source <afile> | PackerCompile')

local use = packer.use

return packer.startup(function()
	use({
		'wbthomason/packer.nvim',
		event = 'VimEnter',
	})

	-- Appearance
	use({
		'NvChad/nvim-base16.lua',
		as = 'theme',
		config = function()
			require('theme')
		end,
	})

	use({
		'feline-nvim/feline.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('plugins.feline')
		end,
	})

	use({
		'akinsho/nvim-bufferline.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('plugins.bufferline')
		end,
	})

	-- LSP and TS Configuration
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('plugins.treesitter')
		end,
	})

	use('nvim-treesitter/nvim-treesitter-textobjects')

	use('nvim-treesitter/nvim-treesitter-refactor')

	use('nvim-treesitter/playground')

	use({
		'vinicius507/asdf.nvim',
		config = function()
			require('asdf-nvim').setup()
		end,
	})

	use({
		'neovim/nvim-lspconfig',
		requires = { 'williamboman/nvim-lsp-installer' },
		config = function()
			require('plugins.lspconfig')
		end,
	})

	use({
		'jose-elias-alvarez/null-ls.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.null')
		end,
	})

	use({
		'folke/lsp-trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('plugins.others').lsptrouble()
		end,
	})

	use({
		'ray-x/lsp_signature.nvim',
		config = function()
			require('plugins.lspsignature')
		end,
	})

	use({
		'tami5/lspsaga.nvim',
		branch = 'nvim6.0',
		config = function()
			require('plugins.lspsaga')
		end,
	})

	use({
		'ahmedkhalf/project.nvim',
		config = function()
			require('plugins.others').project_nvim()
		end,
	})

	-- Cmp
	use({
		'hrsh7th/nvim-cmp',
		config = function()
			require('plugins.compe')
		end,
	})

	use('L3MON4D3/LuaSnip')

	use('hrsh7th/cmp-nvim-lua')

	use('hrsh7th/cmp-nvim-lsp')

	use('saadparwaiz1/cmp_luasnip')

	-- File Navigation
	use({
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('plugins.nvimtree')
		end,
	})

	use('nvim-telescope/telescope-fzy-native.nvim')

	use({
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.telescope')
		end,
	})

	-- Comments
	use({
		'folke/todo-comments.nvim',
		moudule = 'trouble',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.todo_comments')
		end,
	})

	-- Git Plugins
	use({
		'TimUntersberger/neogit',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.neogit')
		end,
	})

	use({
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.others').gitsigns()
		end,
	})

	-- École 42
	use({
		'vinicius507/norme.nvim',
		branch = 'feat/refactor',
	})

	use({
		'vinicius507/header42.nvim',
		branch = 'refactor',
		config = function()
			require('plugins.others').header42()
		end,
	})

	-- Misc
	use({
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('plugins.others').colorizer()
		end,
	})

	use({
		'folke/which-key.nvim',
		config = function()
			require('plugins.whichkey')
		end,
	})

	use({
		'akinsho/nvim-toggleterm.lua',
		keys = [[<c-\>]],
		config = function()
			require('plugins.toggleterm')
		end,
	})

	use({
		'glepnir/dashboard-nvim',
		config = function()
			require('plugins.dashboard')
		end,
	})

	use({
		'mfussenegger/nvim-dap',
		config = function()
			require('plugins.dap')
		end,
	})

	use({
		'windwp/nvim-autopairs',
		config = function()
			require('plugins.others').autopairs()
		end,
	})

	use({
		'rcarriga/nvim-notify',
		config = function()
			vim.notify = require('notify')
		end,
	})

	-- VimScript
	use('tpope/vim-repeat')
	use('tpope/vim-surround')
	use('tpope/vim-commentary')
end)
