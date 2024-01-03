local M = {}

M.name = "neo-tree"

local toggle_neo_tree = function()
    local command = require("neo-tree.command")
    local reveal_file = vim.fn.expand('%:p')
    if (reveal_file == '') then
        reveal_file = vim.fn.getcwd()
    else
        -- this check ensures that file exists
        local f = io.open(reveal_file, "r")
        if (f) then
            f.close(f)
        else
            reveal_file = vim.fn.getcwd()
        end
    end

    command.execute({ toggle = true, reveal_file = reveal_file })
end

M.lazy_config = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
}


M.setup_key_bindings = function()
    vim.keymap.set("n", "<leader>e", toggle_neo_tree)
end

M.setup = function()
    M.setup_key_bindings()
end

return M
