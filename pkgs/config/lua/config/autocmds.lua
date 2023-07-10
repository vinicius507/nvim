local obsidian = vim.api.nvim_create_augroup("obsidian", { clear = true })
local no_autoformat = vim.api.nvim_create_augroup("no_autoformat", { clear = true })

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
