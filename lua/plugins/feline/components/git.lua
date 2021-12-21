local fn = vim.fn
local colors = require('hl_themes.' .. vim.g.base16_theme)

---@param action string
local function get_color(action)
	return fn.synIDattr(fn.synIDtrans(fn.hlID('Diff' .. action)), 'fg#')
end

local action_colors = {
	get_color('Added'),
	get_color('Removed'),
	get_color('Change'),
}

return {
	{
		provider = 'git_diff_added',
		left_sep = ' ',
		hl = {
			fg = action_colors[1],
		},
	},
	{
		provider = 'git_diff_removed',
		left_sep = ' ',
		hl = {
			fg = action_colors[2],
		},
	},
	{
		provider = 'git_diff_changed',
		left_sep = ' ',
		hl = {
			fg = action_colors[3],
		},
	},
	{

		provider = 'git_branch',
		hl = {
			fg = colors.nord_blue,
			style = 'bold',
		},
		left_sep = ' ',
		right_sep = ' ',
	},
}
