local ok, whichkey = pcall(require, 'which-key')

if not ok then
	return
end

local mappings = 'plugins.whichkey.mappings.'

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
