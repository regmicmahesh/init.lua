local M = {}

M.name = "catppuccin"

M.lazy_config = { "catppuccin/nvim", name = M.name }


M.setup = function()
    vim.cmd.colorscheme(M.name)
end

return M
