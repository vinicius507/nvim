return {
	{
		"echasnovski/mini.surround",
		branch = "stable",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		branch = "stable",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.comment",
		branch = "stable",
		config = function()
			require("mini.comment").setup()
		end,
	},
}
