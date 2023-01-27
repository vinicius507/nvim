return {
	"ThePrimeagen/refactoring.nvim",
	keys = {
		{
			"<Leader>r",
			mode = "v",
			desc = "Refactoring",
		},
		{
			"<Leader>rp",
			function()
				require("refactoring").select_refactor()
			end,
			mode = "v",
			desc = "Prompt",
		},
	},
	opts = function()
		local ftopts = {
			c = true,
			h = true,
			cpp = true,
			hpp = true,
			cxx = true,

			go = true,
		}

		return {
			prompt_func_return_type = ftopts,
			prompt_func_param_type = ftopts,
		}
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
}
