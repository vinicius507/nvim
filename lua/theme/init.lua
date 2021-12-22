local base16 = require('base16')

local theme = 'nord'
vim.g.base16_theme = theme
base16(base16.themes(theme))
require('theme.highlights')
