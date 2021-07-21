local M = {}

M.map = {
	vaf = { '<cmd>TSTextobjectSelect @function.outer<CR>', 'outer function' },
	vif = { '<cmd>TSTextobjectSelect @function.inner<CR>', 'inner function' },
	vac = { '<cmd>TSTextobjectSelect @class.outer<CR>', 'outer class' },
	vic = { '<cmd>TSTextobjectSelect @class.inner<CR>', 'inner class' },
	[']m'] = {
		'<cmd>TSTextobjectGotoNextStart @function.outer<CR>',
		'goto next function start',
	},
	[']M'] = {
		'<cmd>TSTextobjectGotoNextEnd @function.outer<CR>',
		'goto next function end',
	},
	['[m'] = {
		'<cmd>TSTextobjectGotoPreviousStart @function.outer<CR>',
		'goto previous function start',
	},
	['[M'] = {
		'<cmd>TSTextobjectGotoPreviousEnd @function.outer<CR>',
		'goto previous function end',
	},
	[']]'] = {
		'<cmd>TSTextobjectGotoNextStart @class.outer<CR>',
		'goto next class start',
	},
	[']['] = {
		'<cmd>TSTextobjectGotoNextEnd @class.outer<CR>',
		'goto next class end',
	},
	['[['] = {
		'<cmd>TSTextobjectGotoPreviousStart @class.outer<CR>',
		'goto previous class start',
	},
	['[]'] = {
		'<cmd>TSTextobjectGotoPreviousEnd @class.outer<CR>',
		'goto previous class end',
	},
}

return M
