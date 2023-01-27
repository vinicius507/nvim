return {
	{
		"cshuaimin/ssr.nvim",
		keys = {
			{

				"<Leader>sR",
				function()
					require("ssr").open()
				end,
				mode = { "n", "x" },
				desc = "Structural replace",
			},
		},
	},
}
