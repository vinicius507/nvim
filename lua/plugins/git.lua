return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				vim.keymap.set("n", "]h", gs.next_hunk, { buffer = buffer, desc = "Next hunk" })
				vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = buffer, desc = "Prev hunk" })
				vim.keymap.set("n", "<Leader>gs", function()
					vim.cmd.Gitsigns("stage_hunk")
				end, { desc = "Stage hunk" })
				vim.keymap.set("n", "<Leader>gr", function()
					vim.cmd.Gitsigns("reset_hunk")
				end, { desc = "Reset hunk" })
				vim.keymap.set("n", "<Leader>gS", gs.stage_buffer, { buffer = buffer, desc = "Stage buffer" })
				vim.keymap.set("n", "<Leader>gu", gs.undo_stage_hunk, { buffer = buffer, desc = "Undo tage hunk" })
				vim.keymap.set("n", "<Leader>gR", gs.reset_buffer, { buffer = buffer, desc = "Reset buffer" })
				vim.keymap.set("n", "<Leader>gp", gs.preview_hunk, { buffer = buffer, desc = "Preview hunk" })
				vim.keymap.set("n", "<Leader>gb", function()
					gs.blame_line({ full = true })
				end, { buffer = buffer, desc = "Blame line" })
			end,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{
				"<Leader>gd",
				function()
					vim.cmd.DiffviewOpen("-uno")
				end,
				desc = "Diff",
			},
			{
				"<Leader>gD",
				function()
					vim.ui.input(
						{
							prompt = "Git rev: ",
							completion = function()
								return { "test" }
							end,
						},
						---@param rev string?
						function(rev)
							if rev == nil or rev == "" then
								return
							end
							vim.cmd.DiffviewOpen(rev, "--cached")
						end
					)
				end,
				desc = "Diff rev",
			},
		},
		opts = {
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
		},
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
