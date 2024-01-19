local M = {}

M.name = "telescope"

M.lazy_config = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    opts = {
        defaults = {
            file_ignore_patterns = { "^vendor/" }
        }
    }
}

M.setup_key_bindings = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})

    vim.keymap.set('n', '<leader>fg', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
end

M.setup = function()
    M.setup_key_bindings()
end

return M
