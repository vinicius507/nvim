local M = {}

local util = require('lspconfig/util')
local root_pattern = util.root_pattern('.git', 'rc.lua')

M.config = {
	root_dir = function (fname)
      local filename = util.path.is_absolute(fname) and fname
        or util.path.join(vim.loop.cwd(), fname)
      return root_pattern(filename) or util.path.dirname(filename)
	end,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
			},
			diagnostics = {
				globals = {
					-- Vim
					'vim',

					-- Awesome
					'awesome',
					'client',
					'root',
					'tag',
					'screen',
					'mouse',
				},
			},
			workspace = {
				library = {
					[ vim.fn.expand('$VIMRUNTIME/lua') ] = true,
					[ vim.fn.expand('$VIMRUNTIME/lua/vim/lsp') ] = true,
					['/usr/share/awesome/lib'] = true,
					[vim.fn.expand('$HOME/.config/awesome')] = true,
				},
			},
		}
	}
}

return M
