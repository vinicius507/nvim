local fn = vim.fn
local diagnostic = vim.diagnostic

---@param severity string
local function get_color(severity)
	return fn.synIDattr(fn.synIDtrans(fn.hlID('Diagnostic' .. severity)), 'fg#')
end

---@param severity string
local function get_icon(severity)
	return fn.sign_getdefined('DiagnosticSign' .. severity)[1].text:match(
		'^(.-)%s*$'
	)
end

local colors = {
	get_color('Error'),
	get_color('Warn'),
	get_color('Info'),
	get_color('Hint'),
}

local icons = {
	get_icon('Error'),
	get_icon('Warn'),
	get_icon('Info'),
	get_icon('Hint'),
}

local function make_provider(severity)
	return {
		provider = function()
			local count = #diagnostic.get(
				fn.bufnr('%'),
				{ severity = severity }
			)
			if count == 0 then
				return ''
			end
			return string.format('%s %d', icons[severity], count)
		end,
		left_sep = ' ',
		hl = {
			fg = colors[severity],
		},
	}
end

return {
	error = make_provider(diagnostic.severity.ERROR),
	warn = make_provider(diagnostic.severity.WARN),
	info = make_provider(diagnostic.severity.INFO),
	hint = make_provider(diagnostic.severity.HINT),
}
