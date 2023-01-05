local remap = require("myriad.keymaps").remap

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	config = function()
		vim.g.neo_tree_remove_legacy_commands = true

		require("neo-tree").setup({
			sort_case_insensitive = true,
			window = {
				width = 32,
			},
			hijack_netrw_behavior = "open_default",
			use_libuv_file_watcher = true,
		})

		remap("<Leader><Tab>", function()
			vim.cmd.Neotree("toggle", "reveal")
		end, { desc = "Files" })
		remap("<Leader>gs", function()
			vim.cmd.Neotree("float", "git_status")
		end, { desc = "Files" })
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}
