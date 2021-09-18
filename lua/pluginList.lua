local ok, _ = pcall(require, 'packerInit')
local packer

if ok then
	packer = require('packer')
else
	return false
end

local cmd = vim.cmd

cmd('autocmd BufWritePost pluginList.lua PackerCompile')

local use = packer.use

return packer.startup(function()
	use({
		'wbthomason/packer.nvim',
		event = 'VimEnter',
	})

	-- Appearance
	use({
		'folke/tokyonight.nvim',
		after = 'packer.nvim',
		as = 'theme',
		config = function()
			require('theme')
		end,
	})

	use({
		'hoob3rt/lualine.nvim',
		after = 'theme',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('plugins.statusline')
		end,
	})

	use({
		'akinsho/nvim-bufferline.lua',
		after = 'theme',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('plugins.bufferline')
		end,
	})

	-- LSP and TS Configuration
	use({
		'nvim-treesitter/nvim-treesitter',
		event = { 'BufRead', 'BufNewFile' },
		branch = '0.5-compat',
		run = ':TSUpdate',
		config = function()
			require('plugins.treesitter')
		end,
	})

	use({
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
		branch = '0.5-compat',
	})

	use({
		'nvim-treesitter/nvim-treesitter-refactor',
		after = 'nvim-treesitter',
	})

	use({
		'neovim/nvim-lspconfig',
		after = 'asdf.nvim',
		requires = { 'kabouzeid/nvim-lspinstall' },
		config = function()
			require('plugins.lspconfig')
		end,
	})

	use({
		'jose-elias-alvarez/null-ls.nvim',
		after = 'nvim-lspconfig',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.null')
		end,
	})

	use({
		'jose-elias-alvarez/nvim-lsp-ts-utils',
		after = 'null-ls.nvim',
	})

	use({
		'folke/lsp-trouble.nvim',
		after = 'nvim-lspconfig',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('plugins.others').lsptrouble()
		end,
	})

	use({
		'folke/lsp-colors.nvim',
		after = 'nvim-lspconfig',
	})

	use({
		'ray-x/lsp_signature.nvim',
		after = 'nvim-lspconfig',
		config = function()
			require('plugins.lspsignature')
		end,
	})

	use({
		'glepnir/lspsaga.nvim',
		after = 'nvim-lspconfig',
		config = function()
			require('plugins.lspsaga')
		end,
	})

	use({
		'ahmedkhalf/project.nvim',
		after = 'nvim-lspconfig',
		config = function()
			require('plugins.others').project_nvim()
		end,
	})

	use({
		'onsails/lspkind-nvim',
		after = 'nvim-lspconfig',
		config = function()
			require('plugins.others').lspkind()
		end,
	})

	-- Presence
	use({
		'andweeb/presence.nvim',
		event = 'BufEnter',
		config = function()
			require('plugins.discord')
		end,
	})

	use({
		'hrsh7th/nvim-compe',
		event = 'InsertEnter',
		config = function()
			require('plugins.compe')
		end,
	})

	-- File Navigation
	use({
		'kyazdani42/nvim-tree.lua',
		cmd = { 'NvimTreeToggle', 'NvimTreeRefresh', 'NvimTreeFindFile' },
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('plugins.nvimtree')
		end,
	})

	use({
		'nvim-telescope/telescope-fzy-native.nvim',
		module = 'telescope',
	})

	use({
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
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
		cmd = 'Neogit',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.neogit')
		end,
	})

	use({
		'lewis6991/gitsigns.nvim',
		event = 'BufRead',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.others').gitsigns()
		end,
	})

	use({
		'sindrets/diffview.nvim',
		cmd = 'DiffviewOpen',
		requires = { 'kyazdani42/nvim-web-devicons' },
	})

	-- Org
	use({
		'kristijanhusak/orgmode.nvim',
		ft = 'org',
		keys = { '<Leader>o' },
		config = function()
			require('plugins.others').orgmode()
		end,
	})

	use({
		'akinsho/org-bullets.nvim',
		module = 'orgmode',
	})

	-- École 42
	use({
		'vinicius507/norme.nvim',
		after = 'null-ls.nvim',
		branch = 'dev',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.others').norme()
		end,
	})

	use({
		'vinicius507/header42.nvim',
		event = { 'BufRead', 'BufNewFile' },
		config = function()
			require('plugins.others').header42()
		end,
	})

	-- Misc
	use({
		'norcalli/nvim-colorizer.lua',
		event = { 'BufRead', 'BufNewFile' },
		config = function()
			require('plugins.others').colorizer()
		end,
	})

	use({
		'folke/which-key.nvim',
		after = 'packer.nvim',
		config = function()
			require('plugins.whichkey')
		end,
	})

	use({
		'akinsho/nvim-toggleterm.lua',
		keys = [[<c-\>]],
		cmd = { 'MakeRun' },
		config = function()
			require('plugins.toggleterm')
		end,
	})

	use({
		'glepnir/dashboard-nvim',
		after = 'packer.nvim',
		config = function()
			require('plugins.dashboard')
		end,
	})

	use({
		'mfussenegger/nvim-dap',
		cmd = {
			'DapSetBreakpoint',
			'DapSetConditionalBreakpoint',
			'DapContinue',
			'DapReplOpen',
		},
		config = function()
			require('plugins.dap')
		end,
	})

	use({
		'theHamsta/nvim-dap-virtual-text',
		after = 'nvim-dap',
	})

	use({
		'vinicius507/asdf.nvim',
		config = function()
			require('plugins.others').asdf()
		end,
	})

	use({
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			require('plugins.others').autopairs()
		end,
	})

	-- VimScript
	use({ 'tpope/vim-commentary', event = { 'BufEnter', 'BufNewFile' } })
	use({ 'tpope/vim-surround', event = { 'BufEnter', 'BufNewFile' } })
	use({ 'tpope/vim-repeat', event = { 'BufEnter', 'BufNewFile' } })
end)
