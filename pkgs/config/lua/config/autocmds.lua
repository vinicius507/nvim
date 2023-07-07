local obsidian = vim.api.nvim_create_augroup("obsidian", { clear = true })
local no_autoformat = vim.api.nvim_create_augroup("no_autoformat", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = obsidian,
	pattern = {
		vim.fn.expand("$HOME") .. "/Documents/myriad/*.md",
		vim.fn.expand("$HOME") .. "/Documents/myriad/**/*.md",
	},
	callback = function(event)
		vim.keymap.set("n", "<Leader>op", vim.cmd.ObsidianOpen, {
			buffer = event.buf,
			desc = "View in Obsidian",
		})
		vim.keymap.set("n", "<Leader>ob", vim.cmd.ObsidianBacklinks, {
			buffer = event.buf,
			desc = "Note backlinks",
		})
		vim.keymap.set("n", "<Leader>of", vim.cmd.ObsidianFollowLink, {
			buffer = event.buf,
			desc = "Follow Link",
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

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = no_autoformat,
	pattern = {
		"c",
		"cpp",
	},
	callback = function(event)
		local enabled_extensions = { "cpp", "hpp" }
		local file_ext = vim.fn.fnamemodify(event.file, ":e")

		-- Since vim sets .h files filetype to cpp, we need to handle .cpp and .hpp files.
		if vim.tbl_contains(enabled_extensions, file_ext) then
			return
		end

		vim.b.autoformat = false
	end,
})
