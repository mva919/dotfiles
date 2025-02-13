vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 spaces for tab instead of vim defaults 8 (ew)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

-- unless if at end of file there will always be 8 lines from bottom while scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
