local M = {}
local config

M.start = function(args, mi_mode, mi_debugger_path)
	local dap = require('dap')
	if args and #args > 0 then
		config = {
			type = 'c',
			name = args[1],
			request = 'launch',
			program = table.remove(args, 1),
			args = args,
			cwd = vim.fn.getcwd(),
			env = {},
			externalConsole = true,
			MIMode = mi_mode or 'gdb',
			MIDebuggerPath = mi_debugger_path,
		}
	end

	if not config then
		print(
			'No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"'
		)
		return
	end

	dap.run(config)
	dap.repl.open({ height = 15 }, 'sp')
end

return M
