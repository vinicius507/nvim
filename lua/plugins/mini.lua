return {
	"echasnovski/mini.surround",
	branch = "stable",
	-- HACK: for now, unable to lazyload plugin with default keys
	event = "BufReadPost",
	opts = {
		mappings = {},
	},
	config = function()
		require("mini.surround").setup({})
	end,
}
