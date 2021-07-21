local M = {}

M.config = {
	bind = true,
	doc_lines = 4,
	floating_window = true,
	hint_enable = false,
	hint_prefix = '',
	hint_scheme = 'String',
	use_lspsaga = false,
	hi_parameter = 'Search',
	max_height = 12,
	max_width = 120,
	handler_opts = {
		border = 'single',
	},
	extra_trigger_chars = {},
}

return M
