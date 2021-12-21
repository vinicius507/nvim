local vi_mode = require('feline.providers.vi_mode')
local colors = require('hl_themes.' .. vim.g.base16_theme)

local mode_colors = {
	NORMAL = colors.blue,
	OP = colors.yellow,
	VISUAL = colors.dark_purple,
	LINES = colors.dark_purple,
	BLOCK = colors.dark_purple,
	SELECT = colors.cyan,
	INSERT = colors.vibrant_green,
	REPLACE = colors.orange,
	['V-REPLACE'] = colors.orange,
	COMMAND = colors.red,
	ENTER = colors.red,
	MORE = colors.red,
	CONFIRM = colors.red,
	SHELL = colors.red,
	TERM = colors.cyan,
	NONE = colors.red,
}

return {
	provider = '  ',
	hl = function()
		return {
			name = vi_mode.get_mode_highlight_name(),
			bg = mode_colors[vi_mode.get_vim_mode()],
			fg = colors.black,
		}
	end,
}
