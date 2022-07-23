local mappings = require("mappings")
local Terminal = require("toggleterm.terminal").Terminal

require("toggleterm").setup({
	size = 15,
	open_mapping = nil,
	hide_numbers = true,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	terminal_mappings = true,
	persist_size = true,
	persist_mode = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	winbar = { enabled = true },
})

local shell = Terminal:new()
local runner = Terminal:new({ close_on_exit = false })
mappings.add({
	"<Leader>ot",
	function()
		shell:toggle()
	end,
	description = "Open terminal",
})
mappings.add({
	"<Leader>cc",
	function()
		runner.cmd = vim.fn.input("Compile command: ", "make -C .")
		runner:toggle()
	end,
	description = "Compile",
})
