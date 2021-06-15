local M = {}

M.config = {
	on_attach = function(client, bufnr)
		require('null-ls').setup()
		client.resolved_capabilities.document_formatting = false

		local ts_utils = require('nvim-lsp-ts-utils')

		ts_utils.setup {
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,

			-- eslint
			eslint_enable_code_actions = true,
			eslint_enable_disable_comments = true,
			eslint_bin = 'eslint',
			eslint_config_fallback = nil,
			eslint_enable_diagnostics = true,

			-- formatting
			enable_formatting = true,
			formatter = 'prettier',
			formatter_config_fallback = nil,

			-- parentheses completion
			complete_parens = false,
			signature_help_in_parens = false,

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,
		}
		ts_utils.setup_client(client)
	end
}

return M
