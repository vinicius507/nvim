return {
	"feline-nvim/feline.nvim",
	after = "catppuccin",
	config = function()
		require("feline").setup({
			components = require("catppuccin.groups.integrations.feline").get(),
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
