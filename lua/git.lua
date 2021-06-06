-- GitSigns
local gitsigns = require('gitsigns')

gitsigns.setup {}

-- Neogit
local neogit = require('neogit')

neogit.setup {
	integrations = {
		diffview = true,
	},
}
