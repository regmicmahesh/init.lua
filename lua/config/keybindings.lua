local M = {}


M.setup = function()
    vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
    vim.keymap.set("n", "<leader>Y", [["+Y]])
    vim.keymap.set("n", "q:", ":q<CR>")

    vim.keymap.set("n", "<leader>qn", ":cnext<CR>")
end

return M
