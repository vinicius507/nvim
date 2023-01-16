local lazyvim = {
	"LazyVim/LazyVim",
	opts = {
		autoformat = false,
		colorscheme = "catppuccin",
	},
}

local disabled_plugins = {
	"ggandor/leap.nvim",
}

return {
	lazyvim,
	vim.tbl_map(function(plugin)
		return { plugin, enabled = false }
	end, disabled_plugins),
}
