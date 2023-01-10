return {
	"phaazon/hop.nvim",
	keys = {
		{
			"<Leader>hc",
			function()
				require("hop").hint_char1()
			end,
			desc = "Hop to char",
		},
		{
			"<Leader>hb",
			function()
				require("hop").hint_char2()
			end,
			desc = "Hop to bigram",
		},
		{
			"<Leader>hl",
			function()
				require("hop").hint_lines_skip_whitespace()
			end,
			desc = "Hop to line",
		},
		{
			"<Leader>hp",
			function()
				require("hop").hint_patterns()
			end,
			desc = "Hop to pattern",
		},
		{
			"<Leader>hw",
			function()
				require("hop").hint_words()
			end,
			desc = "Hop to word",
		},
	},
	opts = {
		case_insensitive = true,
		create_hl_autocmd = false,
		uppercase_labels = false,
		multi_windows = true,
	},
}
