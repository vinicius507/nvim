local obsidian = vim.api.nvim_create_augroup("obsidian", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = obsidian,
	pattern = vim.fn.expand("$HOME") .. "/Documents/myriad/**/*.md",
	callback = function(event)
		vim.keymap.set("n", "<Leader>op", vim.cmd.ObsidianOpen, {
			buffer = event.buf,
			desc = "View in Obsidian",
		})
		vim.keymap.set("n", "<Leader>ob", vim.cmd.ObsidianBacklinks, {
			buffer = event.buf,
			desc = "Note backlinks",
		})
		vim.keymap.set("x", "<Leader>ol", vim.cmd.ObsidianLink, {
			buffer = event.buf,
			desc = "Link to note",
		})
		vim.keymap.set("x", "<Leader>oL", vim.cmd.ObsidianLinkNew, {
			buffer = event.buf,
			desc = "Link to new note",
		})
		vim.keymap.set("n", "<Leader>oT", vim.cmd.ObsidianTemplate, {
			buffer = event.buf,
			desc = "Insert template",
		})
	end,
	desc = "Obsidian Keymaps",
})
