local fn = vim.fn
local bo = vim.bo
local colors = require('hl_themes.' .. vim.g.base16_theme)

return {
	provider = function()
		local filename = fn.expand('%:t')
		if filename == '' then
			return 'No File'
		end
		if bo.ro then
			filename = string.format('%s %s', filename, '')
		end
		return filename
	end,
	icon = function()
		local filename = fn.expand('%:t')
		local icon, color = require('nvim-web-devicons').get_icon_color(
			filename,
			fn.expand('%:e')
		)
		return {
			str = string.format(' %s ', icon or ''),
			hl = {
				fg = color or colors.nord_blue,
			},
		}
	end,
	hl = function()
		return {
			fg = bo.ro and colors.baby_pink or (bo.mod and colors.nord_blue),
		}
	end,
}
