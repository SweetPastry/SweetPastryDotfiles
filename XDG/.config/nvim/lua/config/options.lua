-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.relativenumber = false

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
-- opt.showbreak = "↪ "

opt.autowrite = true
opt.autowriteall = true

vim.cmd("colorscheme default")
vim.opt.termguicolors = false
vim.cmd("set t_Co=256")
