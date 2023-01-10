return {
	"phaazon/hop.nvim",
	keys = {
		{
			"gs<Space>",
			function()
				require("hop").hint_char2()
			end,
			desc = "Hop to bigram",
		},
	},
	opts = {
		case_insensitive = true,
		create_hl_autocmd = false,
		uppercase_labels = false,
		multi_windows = true,
	},
}
