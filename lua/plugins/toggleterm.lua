local mappings = require("mappings")
local Terminal = require("toggleterm.terminal").Terminal

require("toggleterm").setup({
	size = 15,
	open_mapping = [[<C-\>]],
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

local runner = Terminal:new({ close_on_exit = false })

local function get_compile_cmd()
	local ok, last_cmd = pcall(vim.api.nvim_tabpage_get_var, 0, "last_compile_cmd")
	if not ok then
		last_cmd = "make -C ."
	end
	local compile_cmd = vim.fn.input("Compile command: ", last_cmd)
	vim.api.nvim_tabpage_set_var(0, "last_compile_cmd", compile_cmd)
	return compile_cmd
end

mappings.add({
	"<Leader>cc",
	function()
		runner.cmd = get_compile_cmd()
		if runner.cmd ~= "" then
			runner:toggle()
		end
	end,
	description = "Compile",
})
