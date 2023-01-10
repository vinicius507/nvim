return {
	"s1n7ax/nvim-window-picker",
	tag = "v1.2",
	keys = {
		{
			"<Leader>wp",
			function()
				require("window-picker").pick_window()
			end,
			desc = "Pick window",
		},
	},
	opts = function(_, opts)
		local colors = require("catppuccin.palettes").get_palette()

		opts.autoselect_one = true
		opts.include_current_win = true
		opts.filter_rules = {
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
		}
		opts.fg_color = colors.base
		opts.current_win_hl_color = colors.red
		opts.other_win_hl_color = colors.green
	end,
}
