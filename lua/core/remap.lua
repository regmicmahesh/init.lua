vim.g.mapleader = " "


vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])



vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format);



vim.keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')

-- open neotree
-- lol im not a noob anymore to use file explorer. embrace the vim and it's builtin netrw file explorer
-- vim.keymap.set("n", "<leader>e", ":NeoTreeFocusToggle<CR>", {silent = true})


vim.keymap.set("n", "q:", ":q<CR>")

-- vim.opt.autochdir = false
