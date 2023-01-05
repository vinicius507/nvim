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
}
