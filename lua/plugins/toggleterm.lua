local mappings = require("mappings")
local Terminal = require("toggleterm.terminal").Terminal

require("toggleterm").setup({
	size = 15,
	open_mapping = "<Leader>ot",
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

mappings.add({
	"<Leader>cc",
	function()
		local terminal = Terminal:new({
			cmd = vim.fn.input("Compile command: ", "make -C ."),
			close_on_exit = false,
		})
		terminal:open()
	end,
	description = "Compile",
})
