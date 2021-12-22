local fn = vim.fn
local bo = vim.bo
local colors = require('hl_themes.' .. vim.g.base16_theme)

local providers = {
	['^.*NvimTree.*$'] = {
		icon = {
			str = '  ',
			hl = {
				fg = colors.nord_blue,
				bg = colors.darker_black,
			},
		},
		filename = 'NvimTree',
		hl = {
			bg = colors.darker_black,
			style = 'bold',
		},
	},
	['^.*Neogit.*$'] = {
		icon = {
			str = '  ',
			hl = { fg = colors.orange },
		},
		filename = 'NeoGit',
		hl = { style = 'bold' },
	},
	['^.*COMMIT.*$'] = {
		icon = {
			str = '  ',
			hl = { fg = colors.orange },
		},
		filename = 'Commit',
		hl = { style = 'bold' },
	},
}
setmetatable(providers, {
	__index = function(self, key)
		for k, v in pairs(self) do
			if key:match(k) then
				return v
			end
		end
		return nil
	end,
	__newindex = function()
		error('trying to modify const value')
	end,
})

return {
	provider = function()
		local filename = fn.expand('%:t')
		if filename == '' then
			return 'No File'
		elseif providers[filename] ~= nil then
			return providers[filename].filename
		end
		if bo.ro then
			filename = string.format('%s %s', filename, '')
		end
		return filename
	end,
	icon = function()
		local icon
		local filename = fn.expand('%:t')
		if providers[filename] ~= nil then
			icon = providers[filename].icon
		else
			local _icon, color = require('nvim-web-devicons').get_icon_color(
				filename,
				fn.expand('%:e')
			)
			icon = {
				str = string.format(' %s ', _icon or ''),
				hl = {
					fg = color or colors.nord_blue,
				},
			}
		end
		return icon
	end,
	hl = function()
		local filename = fn.expand('%:t')
		if providers[filename] ~= nil then
			return providers[filename].hl
		end
		return {
			fg = bo.ro and colors.baby_pink or (bo.mod and colors.nord_blue),
		}
	end,
}
