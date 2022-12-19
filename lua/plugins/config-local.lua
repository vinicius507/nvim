local config_local = require("config-local")

config_local.setup({
	config_files = { ".vimrc.lua", ".vimrc" },
	lookup_parents = true,
	silent = false,
})
