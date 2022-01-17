local cmd = vim.cmd
local colors = require('hl_themes.' .. vim.g.base16_theme)

---Define bg color
---@param group string
---@param color string
local function bg(group, color)
	cmd('hi ' .. group .. ' guibg=' .. color)
end

---Define fg color
---@param group string
---@param color string
local function fg(group, color)
	cmd('hi ' .. group .. ' guifg=' .. color)
end

---Define bg and fg color
---@param group string
---@param fgcol string
---@param bgcol string
local function fg_bg(group, fgcol, bgcol)
	cmd('hi ' .. group .. ' guifg=' .. fgcol .. ' guibg=' .. bgcol)
end

local function sp(group, color)
	cmd('hi ' .. group .. ' cterm=underline gui=underline guisp=' .. color)
end

local function link(group, target)
	cmd('hi link ' .. group .. ' ' .. target)
end

bg('Normal', colors.black)

-- Line number
fg('cursorlinenr', colors.white)

--- Hide ~ at the end of the file
fg('EndOfBuffer', colors.black)

-- Comments
fg('Comment', colors.grey_fg)

---Treesitter
bg('TSWarning', 'NONE')

fg('TSString', colors.vibrant_green)
fg('TSNumber', colors.yellow)
fg('TSConstant', colors.sun)
fg('TSBoolean', colors.orange)

fg('TSType', colors.yellow)
fg('TSMethod', colors.blue)
fg('TSParameter', colors.teal)
fg('TSProperty', colors.blue)
fg('TSTypeBuiltin', colors.yellow)
fg('TSOperator', colors.blue)
fg('TSVariableBuiltin', colors.red)

fg('TSPunctBracket', colors.blue)
fg('TSPunctDelimiter', colors.blue)

fg('TSKeyword', colors.teal)
fg('TSKeywordFunction', colors.blue)
fg('TSKeywordReturn', colors.baby_pink)
fg('TSKeywordOperator', colors.yellow)
fg('TSConditional', colors.teal)

-- Floats
fg('FloatBorder', colors.blue)
bg('NormalFloat', colors.darker_black)

fg('LineNr', colors.one_bg3)
fg('NvimInternalError', colors.red)
fg('VertSplit', colors.one_bg)

-- Dashboard
fg('DashboardCenter', colors.blue)
fg('DashboardFooter', colors.white)
fg('DashboardHeader', colors.white)

-- Neogit
fg_bg('DiffAdd', colors.blue, 'NONE')
fg_bg('DiffChange', colors.dark_purple, 'NONE')
fg_bg('DiffChangeDelete', colors.red, 'NONE')
fg_bg('DiffModified', colors.dark_purple, 'NONE')
fg_bg('DiffRemoved', colors.red, 'NONE')
fg_bg('DiffDelete', colors.red, 'NONE')
fg_bg('NeogitNotificationInfo', colors.vibrant_green, 'NONE')
fg_bg('NeogitNotificationError', colors.red, 'NONE')
fg_bg('NeogitNotificationWarning', colors.yellow, 'NONE')

-- Diagnostics
fg('DiagnosticHint', colors.purple)
fg('DiagnosticError', colors.red)
fg('DiagnosticWarn', colors.yellow)
fg('DiagnosticInformation', colors.green)
sp('DiagnosticUnderlineHint', colors.purple)
sp('DiagnosticUnderlineError', colors.red)
sp('DiagnosticUnderlineWarn', colors.yellow)
sp('DiagnosticUnderlineInformation', colors.green)

-- NvimTree
fg('NvimTreeEmptyFolderName', colors.one_bg3)
fg('NvimTreeEndOfBuffer', colors.darker_black)
fg('NvimTreeFolderIcon', colors.nord_blue)
fg('NvimTreeFolderName', colors.nord_blue)
fg('NvimTreeIndentMarker', colors.one_bg)
bg('NvimTreeNormal', colors.darker_black)
bg('NvimTreeNormalNC', colors.darker_black)
fg('NvimTreeOpenedFolderName', colors.nord_blue)
fg('NvimTreeRootFolder', colors.red .. ' gui=underline') -- enable underline for root folder in nvim tree
fg_bg('NvimTreeStatuslineNc', colors.darker_black, colors.darker_black)
fg_bg('NvimTreeVertSplit', colors.black, colors.black)
bg('NvimTreeCursorLine', colors.black2)
fg_bg('NvimTreeWindowPicker', colors.red, colors.darker_black)

-- Telescope
bg('TelescopeNormal', colors.darker_black)
fg_bg('TelescopeBorder', colors.white, colors.darker_black)
fg_bg('TelescopePromptTitle', colors.yellow, 'NONE')
bg('TelescopePromptNormal', colors.darker_black)
fg_bg('TelescopePromptPrefix', colors.cyan, colors.darker_black)
fg_bg('TelescopePromptBorder', colors.white, colors.darker_black)
fg_bg('TelescopePreviewTitle', colors.yellow, 'NONE')
bg('TelescopePreviewNormal', colors.darker_black)
fg_bg('TelescopePreviewBorder', colors.white, colors.darker_black)
fg_bg('TelescopeResultsTitle', colors.yellow, 'NONE')
fg('TelescopeMultiSelection', colors.blue)
fg_bg('TelescopeSelection', colors.nord_blue, colors.darker_black)

-- WhichKey
fg('WhichKey', colors.sun)
fg('WhichKeyDesc', colors.nord_blue)
fg('WhichKeyGroup', colors.dark_purple)
fg('WhichKeyValue', colors.baby_pink)
bg('WhichKeyFloat', colors.darker_black)

-- Neogit
fg('NeogitDiffAdd', colors.vibrant_green)
fg('NeogitDiffAddHighlight', colors.vibrant_green)
fg('NeogitDiffDelete', colors.baby_pink)
fg('NeogitDiffDeleteHighlight', colors.baby_pink)
fg('NeogitPopupSwitchEnabled', colors.nord_blue)

-- Git
fg('gitCommitSummary', colors.nord_blue)
fg('gitCommitSelectedFile', colors.yellow)

-- TODO: Comments
-- HACK: Comments
-- FIXME: Comments
-- NOTE: Comments
-- PERF: Comments
-- WARN: Comments
fg('TodoFgTODO', colors.white)
fg_bg('TodoBgTODO', colors.nord_blue, 'NONE')
fg('TodoSignTODO', colors.nord_blue)
fg('TodoFgHACK', colors.white)
fg_bg('TodoBgHACK', colors.orange, 'NONE')
fg('TodoSignHACK', colors.orange)
fg('TodoFgFIX', colors.white)
fg_bg('TodoBgFIX', colors.red, 'NONE')
fg('TodoSignFIX', colors.red)
fg('TodoFgNOTE', colors.white)
fg_bg('TodoBgNOTE', colors.vibrant_green, 'NONE')
fg('TodoSignNOTE', colors.vibrant_green)
fg('TodoFgPERF', colors.white)
fg_bg('TodoBgPERF', colors.baby_pink, 'NONE')
fg('TodoSignPERF', colors.baby_pink)
fg('TodoFgWARN', colors.white)
fg_bg('TodoBgWARN', colors.yellow, 'NONE')
fg('TodoSignWARN', colors.yellow)

-- TODO: Lspsaga.nvim

-- Notify
fg('NotifyERRORBorder', colors.red)
fg('NotifyWARNBorder', colors.yellow)
fg('NotifyINFOBorder', colors.vibrant_green)
fg('NotifyDEBUGBorder', colors.baby_pink)
fg('NotifyTRACEBorder', colors.grey_fg)
fg('NotifyERRORIcon', colors.red)
fg('NotifyWARNIcon', colors.yellow)
fg('NotifyINFOIcon', colors.vibrant_green)
fg('NotifyDEBUGIcon', colors.baby_pink)
fg('NotifyTRACEIcon', colors.grey_fg)
fg('NotifyERRORTitle', colors.red)
fg('NotifyWARNTitle', colors.yellow)
fg('NotifyINFOTitle', colors.vibrant_green)
fg('NotifyDEBUGTitle', colors.baby_pink)
fg('NotifyTRACETitle', colors.grey_fg)
fg('NotifyERRORBody', colors.white)
fg('NotifyWARNBody', colors.white)
fg('NotifyINFOBody', colors.white)
fg('NotifyDEBUGBody', colors.white)
fg('NotifyTRACEBody', colors.white)

cmd([[
augroup theme_reloader
	autocmd!
	autocmd BufWritePost highlights.lua so <afile>
augroup end
]])
