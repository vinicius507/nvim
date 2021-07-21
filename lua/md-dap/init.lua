local dap = require('dap')

dap.adapters.c = {
	type = 'executable',
	attach = {
		pidProperty = 'pid',
		pidSelect = 'ask',
	},
	command = 'lldb-vscode',
	env = {
		LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES',
	},
	name = 'lldb',
}
