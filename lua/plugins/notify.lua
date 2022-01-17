local notify = require('notify')

notify.setup({
	stages = 'fade',
	timout = 2000,
	icons = {
		ERROR = '',
		WARN = '',
		INFO = '',
		DEBUG = '',
		TRACE = '✎',
	},
})

vim.notify = notify
