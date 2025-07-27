-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map({ "n", "v" }, "<C-e>", "$", opts)
map({ "n", "v" }, "<C-a>", "0", opts)

map("i", "<C-e>", "<Esc>A", opts)
map("i", "<C-a>", "<Esc>I", opts)