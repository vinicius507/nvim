local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true

opt.hidden = true
opt.showmode = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true

opt.clipboard = "unnamedplus"

opt.undofile = true
opt.undodir = vim.fn.stdpath("cache") .. "undo"

opt.mouse = "a"

opt.list = true
opt.listchars:append("eol: ")
opt.listchars:append("tab: ")
opt.listchars:append("space: ")
opt.listchars:append("nbsp: ")
opt.listchars:append("trail:~")
opt.shortmess:append("s")
opt.shortmess:append("c")

opt.fillchars:append("eob: ")

opt.guifont = "JetBrainsMono Nerd Font Mono"
