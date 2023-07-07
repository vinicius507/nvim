return {
	"catppuccin/nvim",
	name = "catppuccin",
	build = ":CatppuccinCompile",
	opts = {
		flavour = "mocha",
		term_colors = true,
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			keywords = { "italic" },
		},
		integrations = {
			cmp = true,
			dashboard = true,
			gitsigns = true,
			hop = true,
			illuminate = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			leap = true,
			lsp_trouble = true,
			markdown = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
			navic = {
				enabled = true,
				custom_bg = require("catppuccin.palettes").get_palette().mantle,
			},
			neogit = true,
			neotree = true,
			noice = true,
			notify = true,
			telescope = true,
			treesitter = true,
			which_key = true,
		},
		custom_highlights = function(colors)
			return {
				CmpItemKindSnippet = { fg = colors.mantle, bg = colors.mauve },
				CmpItemKindKeyword = { fg = colors.mantle, bg = colors.red },
				CmpItemKindText = { fg = colors.mantle, bg = colors.teal },
				CmpItemKindMethod = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindConstructor = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindFunction = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindFolder = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindModule = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindConstant = { fg = colors.mantle, bg = colors.peach },
				CmpItemKindField = { fg = colors.mantle, bg = colors.green },
				CmpItemKindProperty = { fg = colors.mantle, bg = colors.green },
				CmpItemKindEnum = { fg = colors.mantle, bg = colors.green },
				CmpItemKindUnit = { fg = colors.mantle, bg = colors.green },
				CmpItemKindClass = { fg = colors.mantle, bg = colors.yellow },
				CmpItemKindVariable = { fg = colors.mantle, bg = colors.flamingo },
				CmpItemKindFile = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindInterface = { fg = colors.mantle, bg = colors.yellow },
				CmpItemKindColor = { fg = colors.mantle, bg = colors.red },
				CmpItemKindReference = { fg = colors.mantle, bg = colors.red },
				CmpItemKindEnumMember = { fg = colors.mantle, bg = colors.red },
				CmpItemKindStruct = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindValue = { fg = colors.mantle, bg = colors.peach },
				CmpItemKindEvent = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindOperator = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindTypeParameter = { fg = colors.mantle, bg = colors.blue },
				CmpItemKindCopilot = { fg = colors.mantle, bg = colors.teal },
				Pmenu = { bg = colors.mantle },
			}
		end,
	},
	lazy = false,
	priority = 1000,
}