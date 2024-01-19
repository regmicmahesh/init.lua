local M = {}

M.name = "nvim-treesitter"

M.lazy_config = { { "nvim-treesitter/nvim-treesitter", name = M.name }, { "nvim-treesitter/nvim-treesitter-textobjects" } }


M.setup = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
        modules = {},
        ensure_installed = { "c", "lua", "vim", "rust", "javascript", "typescript", "python" },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.outer",
                },
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V',  -- linewise
                    ['@class.outer'] = '<c-v>', -- blockwise
                },
                -- If you set this to `true` (default is `false`) then any textobject is
                -- extended to include preceding or succeeding whitespace. Succeeding
                -- whitespace has priority in order to act similarly to eg the built-in
                -- `ap`.
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * selection_mode: eg 'v'
                -- and should return true of false
                include_surrounding_whitespace = true,
            }
        },
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
