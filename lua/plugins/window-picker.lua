local remap = require("myriad.keymaps").remap

return {
	"s1n7ax/nvim-window-picker",
	tag = "v1.2",
	config = function()
		local wp = require("window-picker")
		local colors = require("catppuccin.palettes").get_palette()

		wp.setup({
			autoselect_one = true,
			include_current_win = true,
			filter_rules = {
				bo = {
					filetype = {
						"neo-tree",
						"neo-tree-popup",
						"notify",
					},
					buftype = {
						"quickfix",
						"terminal",
					},
				},
			},
			fg_color = colors.base,
			current_win_hl_color = colors.red,
			other_win_hl_color = colors.green,
		})

		remap("<Leader>wp", wp.pick_window, { desc = "Pick window" })
	end,
}
