local mappings = require("mappings")

mappings.add({
	"<Leader>fS",
	function()
		local ft = vim.api.nvim_buf_get_option(0, "filetype")
		if ft ~= "lua" and ft ~= "vim" then
			return
		end
		if vim.fn.confirm(string.format("Source %s?", vim.fn.expand("%:t")), "&Yes\n&No", 1) then
			vim.cmd([[source]])
		end
	end,
	buffer = vim.api.nvim_get_current_buf(),
	description = "Source file",
})
