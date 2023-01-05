local remap = require("myriad.keymaps").remap

return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gs = require("gitsigns")

			gs.setup({ current_line_blame = true })

			remap("<Leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
			remap("<Leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
			remap("<Leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
			remap("<Leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
			remap("<Leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
			remap("<Leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
			remap("<Leader>gb", function()
				gs.blame_line({ full = true })
			end, { desc = "Blame line" })
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({
				keymaps = {
					view = { q = vim.cmd.DiffviewClose },
					file_panel = { q = vim.cmd.DiffviewClose },
				},
				hooks = {
					diff_buf_read = function()
						vim.opt_local.list = false
						vim.opt_local.wrap = false
					end,
				},
			})

			remap("<Leader>gd", function()
				vim.cmd.DiffviewOpen("-uno")
			end, { desc = "Diff HEAD" })
			remap("<Leader>gD", function()
				local rev = vim.fn.input("Git rev: ")

				if rev then
					vim.cmd.DiffviewOpen(rev, "--cached")
				end
			end, { desc = "Diff rev" })
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
