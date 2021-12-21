local ok, dap = pcall(require, 'dap')

if not ok then
	return
end

local cmd = vim.cmd

cmd([[command! DapSetBreakpoint lua require('dap').toggle_breakpoint()]])
cmd(
	[[command! DapSetConditionalBreakpoint lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))]]
)
cmd([[command! DapContinue lua require('dap').continue()]])
cmd(
	[[command! DapReplOpen lua require('dap').repl.open({ height = 15 }, 'sp')]]
)

dap.adapters.lldb = {
	name = 'lldb',
	type = 'executable',
	command = '/usr/bin/lldb-vscode',
}

dap.configurations.c = {
	{
		name = 'Default',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input(
				'Path to executable: ',
				vim.fn.getcwd() .. '/a.out',
				'file'
			)
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		runInTerminal = false,
	},
}

require('dap.ext.vscode').load_launchjs()
