local bo = vim.bo
local wo = vim.wo

bo.expandtab = true
wo.listchars = string.gsub(vim.opt.listchars._value, "space:", "space: ")
