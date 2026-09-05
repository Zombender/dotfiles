-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "tj", ":bprev<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "tk", ":bnext<enter>", { noremap = false })

vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", { noremap = false })
