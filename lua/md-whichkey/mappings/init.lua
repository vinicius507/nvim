local whichkey = require('which-key')

local mappings = 'md-whichkey.mappings.'

local list = {
	'leader',
	'treesitter',
}

local register_maps = function(maps)
	for _, value in ipairs(maps) do
		local m = require(mappings .. value)
		whichkey.register(m.map, m.prefix and { prefix = m.prefix })
	end
end

register_maps(list)
