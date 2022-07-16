local packer = require("packer")

packer.startup({
	function()
		packer.use("wbthomason/packer.nvim")
	end,
	config = {},
})

vim.cmd([[
	augroup packer_user_config
	  autocmd!
	  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end 
]])
