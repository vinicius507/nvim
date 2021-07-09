local M = {}

M.map = {
	vaf = { '<cmd>TSTextobjectSelect @function.outer<CR>', 'outer function' },
	vif = { '<cmd>TSTextobjectSelect @function.inner<CR>', 'inner function' },
	vac = { '<cmd>TSTextobjectSelect @class.outer<CR>', 'outer class' },
	vic = { '<cmd>TSTextobjectSelect @class.inner<CR>', 'inner class' },
}

return M
