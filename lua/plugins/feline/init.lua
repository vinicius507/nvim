local feline = require('feline')

local colors = require('hl_themes.nord')

local vi_mode = require('plugins.feline.components.vi_mode')
local filename = require('plugins.feline.components.filename')
local diagnostics = require('plugins.feline.components.diagnostics')
local git = require('plugins.feline.components.git')

local components = {
	active = {
		-- NOTE: Left
		{
			vi_mode,
			filename,
			diagnostics.error,
			diagnostics.warn,
			diagnostics.info,
			diagnostics.hint,
		},
		-- NOTE: Middle
		{},
		-- NOTE: Right
		{
			unpack(git),
		},
	},
	inactive = {
		-- NOTE: Left
		{
			filename,
		},
		-- NOTE: Middle
		{},
		-- NOTE: Right
		{},
	},
}

feline.setup({
	theme = {
		fg = colors.white,
		bg = colors.black,
	},
	components = components,
	force_inactive = {
		filetypes = {
			'^.*Neogit.*$',
			'^.*Trouble.*$',
			'^NvimTree$',
			'^help$',
			'^man$',
			'^dashboard$',
		},
	},
})
