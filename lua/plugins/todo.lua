local mappings = require("mappings")

require("todo-comments").setup()

mappings.add({
	"<Leader>tf",
	vim.cmd.TodoTelescope,
	description = "Find comment annotation",
})
mappings.add({
	"<Leader>tF",
	function()
		local keywords = vim.fn.input("Keywords: ")
		vim.cmd.TodoTelescope(string.format("keywords=%s", keywords))
	end,
	description = "Find comment annotation by keywords",
})
mappings.add({
	"<Leader>tt",
	vim.cmd.TodoTrouble,
	description = "Trouble comment annotations",
})
mappings.add({
	"<Leader>tT",
	function()
		local keywords = vim.fn.input("Keywords: ")
		vim.cmd.TodoTrouble(string.format("keywords=%s", keywords))
	end,
	description = "Find comment annotation by keywords",
})
