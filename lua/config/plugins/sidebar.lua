local M = {}

M.name = "sidebar-nvim"

M.lazy_config = { "sidebar-nvim/sidebar.nvim", name = M.name }


M.setup = function()
    local sidebar = require("sidebar-nvim")
    sidebar.setup({
        -- open = true, -- Closed by default
        sections = { "files", "git", "symbols", "diagnostics" }
    })
    vim.keymap.set('n', '<leader>e', sidebar.toggle)
end

return M
