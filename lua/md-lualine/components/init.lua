local M = {}
local components = 'md-lualine.components.'

local list = {
	'filetype',
}

local load = function(comp)
	for _, value in ipairs(comp) do
		M[value] = require(components .. value)
	end
end

load(list)

return M
