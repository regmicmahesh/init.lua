local M = {}

M.name = "Navigator"

M.lazy_config = { "numToStr/Navigator.nvim", name = M.name }

M.setup_key_bindings = function()
    local navigator = require("Navigator")
    vim.keymap.set({ 'n', 't' }, '<C-h>', navigator.left)
    vim.keymap.set({ 'n', 't' }, '<C-l>', navigator.right)
    vim.keymap.set({ 'n', 't' }, '<C-k>', navigator.up)
    vim.keymap.set({ 'n', 't' }, '<C-j>', navigator.down)
end

M.setup = function()
    local navigator = require("Navigator")
    navigator.setup()
    M.setup_key_bindings()
end

return M
