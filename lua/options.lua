local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.hidden = true
opt.showmode = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

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
opt.listchars:append("space:")
opt.listchars:append("nbsp: ")

opt.fillchars:append("eob: ")
