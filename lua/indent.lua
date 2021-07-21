local vimg = vim.g

local options = {
	use_treesitter = true,
	show_current_context = true,
	context_patterns = {
		'if',
		'while',
		'for',
		'else',
		'class',
		'function',
		'method',
		'local',
	},
	filetype_exclude = { 'NvimTree', 'dashboard' },
	show_end_of_line = true,
	char = '│',
}

local set_options = function(opt)
	for key, value in pairs(opt) do
		vimg['indent_blankline_' .. key] = value
	end
end

set_options(options)
