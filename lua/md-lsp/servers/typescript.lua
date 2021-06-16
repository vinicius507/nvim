local M = {}

M.config = {
	on_attach = function(client, _)
		-- disable tsserver formatting if you plan on formatting via null-ls
		client.resolved_capabilities.document_formatting = false

		require('null-ls').setup()
		local ts_utils = require('nvim-lsp-ts-utils')

		-- defaults
		ts_utils.setup {
			debug = false,
			disable_commands = false,
			enable_import_on_completion = false,

			-- eslint
			eslint_enable_code_actions = true,
			eslint_enable_disable_comments = true,
			eslint_bin = 'eslint_d',
			eslint_config_fallback = nil,
			eslint_enable_diagnostics = true,

			-- formatting
			enable_formatting = true,
			formatter = 'prettierd',
			formatter_config_fallback = nil,

			-- parentheses completion
			complete_parens = false,
			signature_help_in_parens = false,

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,
		}

		-- required to fix code action ranges
		ts_utils.setup_client(client)
	end
}

return M
