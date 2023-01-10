local opt = vim.opt
local remap = require("config.keymaps").remap

remap("<Leader>fS", vim.cmd.source, {
	buffer = vim.api.nvim_get_current_buf(),
	desc = "Source vim file",
})

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
