local opt = vim.opt

vim.keymap.set("n", "<Leader>fS", vim.cmd.source, {
	buffer = vim.api.nvim_get_current_buf(),
	desc = "Source lua file",
})

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
