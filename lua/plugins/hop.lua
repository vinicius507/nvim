local remap = require("myriad.keymaps").remap

return {
	"phaazon/hop.nvim",
	config = function()
		local hop = require("hop")

		hop.setup({
			case_insensitive = true,
			create_hl_autocmd = false,
			uppercase_labels = false,
			multi_windows = true,
		})

		remap("<Leader>hc", hop.hint_char1, { desc = "Hop to char" })
		remap("<Leader>hb", hop.hint_char2, { desc = "Hop to bigram" })
		remap("<Leader>hl", hop.hint_lines_skip_whitespace, { desc = "Hop to line" })
		remap("<Leader>hp", hop.hint_patterns, { desc = "Hop to pattern" })
		remap("<Leader>hw", hop.hint_words, { desc = "Hop to word" })
	end,
}
