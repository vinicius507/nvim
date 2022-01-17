local fn = vim.fn

---@param severity string
local function get_color(severity)
	return fn.synIDattr(fn.synIDtrans(fn.hlID('Diagnostic' .. severity)), 'fg#')
end

local colors = {
	get_color('Error'),
	get_color('Warn'),
	get_color('Info'),
	get_color('Hint'),
}

return {
	error = {
		provider = 'diagnostic_errors',
		hl = { fg = colors[1] },
	},
	warn = {
		provider = 'diagnostic_warnings',
		hl = { fg = colors[2] },
	},
	info = {
		provider = 'diagnostic_info',
		hl = { fg = colors[3] },
	},
	hint = {
		provider = 'diagnostic_hints',
		hl = { fg = colors[4] },
	},
}
