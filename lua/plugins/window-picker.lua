return {
	"s1n7ax/nvim-window-picker",
	tag = "v1.5",
	keys = {
		{
			"<Leader>wp",
			function()
				require("window-picker").pick_window()
			end,
			desc = "Pick window",
		},
	},
	opts = function()
		local colors = require("catppuccin.palettes").get_palette()

		return {
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
			selection_display = function(char)
				return string.format("[%s] %s", char, "%f")
			end,
		}
	end,
}
