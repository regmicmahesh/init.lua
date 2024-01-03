local M = {}

M.name = "nvim-treesitter"

M.lazy_config = { "nvim-treesitter/nvim-treesitter", name = M.name }


M.setup = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
        ensure_installed = { "c", "lua", "vim", "rust", "javascript", "typescript", "python" },
        sync_install = false,
        auto_install = true,
        ignore_install = { "javascript" },

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    })
end

return M
