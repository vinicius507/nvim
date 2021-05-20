local cmd = vim.cmd
local vimg = vim.g

cmd('set termguicolors')
cmd('colorscheme tokyonight')
vimg['tokyonight_style'] = 'storm'
vimg['tokyonight_sidebars'] = { 'NvimTree', 'packer' }
vimg['tokyonight_dark_sidebar'] = true
