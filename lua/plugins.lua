	vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto Compile when there are changes in plugins.lua

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute "packadd packer.nvim"
end

-- Function for opt plugins
local require_plugin = function(plugin)
	local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

	local plugin_path = plugin_prefix .. plugin .. "/"
	local ok, err, code = os.rename(plugin_path, plugin_path)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	if ok then
		vim.cmd("packadd " .. plugin)
	end
	return ok, err, code
end

return require('packer').startup(function (use)
	-- Packer
	use 'wbthomason/packer.nvim'

	-- Appearance
	use 'folke/tokyonight.nvim'
	use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
	use { 'akinsho/nvim-bufferline.lua', requires = { 'kyazdani42/nvim-web-devicons'} }

	-- Tpope
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'kabouzeid/nvim-lspinstall'
	use 'folke/lsp-colors.nvim'
	use 'folke/lsp-trouble.nvim'
	use 'ray-x/lsp_signature.nvim'

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Compe
	use 'hrsh7th/nvim-compe'

	-- Telescope
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } }
	use 'nvim-telescope/telescope-fzy-native.nvim'

	-- Which Key
	use { 'folke/which-key.nvim' }

	-- Toggle Terminal
	use 'akinsho/nvim-toggleterm.lua'

	-- TODO Comments
	use { 'folke/todo-comments.nvim', requires = { 'nvim-lua/plenary.nvim' } }

	-- Nvim-tree
	use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

	-- Indent Blank Lines
	use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }

	-- DiffView
	use { 'sindrets/diffview.nvim', requires = { 'kyazdani42/nvim-web-devicons'} }

	-- Gitsigns
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }	}

	-- Neogit
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

	-- Lsp-rooter.nvim
	use { "ahmedkhalf/lsp-rooter.nvim" }

	-- Norme.nvim
	use { 'vinicius507/norme.nvim', requires = { 'mfussenegger/nvim-lint' } }

	-- 42 Header
	use 'eduardomosko/header42.nvim'
end
)
