local hop = require("hop")
local mappings = require("mappings")

hop.setup({
	case_insensitive = true,
	create_hl_autocmd = false,
	uppercase_labels = true,
	multi_windows = true,
})

mappings.add({
	"<Leader>hc",
	hop.hint_char1,
	description = "Hop to char",
})
mappings.add({
	"<Leader>hb",
	hop.hint_char2,
	description = "Hop to bigram",
})
mappings.add({
	"<Leader>hl",
	hop.hint_lines_skip_whitespace,
	description = "Hop to line",
})
mappings.add({
	"<Leader>hp",
	hop.hint_patterns,
	description = "Hop to pattern",
})
mappings.add({
	"<Leader>hw",
	hop.hint_words,
	description = "Hop to word",
})
