return {
	"feline-nvim/feline.nvim",
	after = "catppuccin",
	config = function()
		require("feline").setup({
			components = require("catppuccin.groups.integrations.feline").get(),
		})
	end,
	dependencies = { "kyazdani42/nvim-web-devicons" },
}
