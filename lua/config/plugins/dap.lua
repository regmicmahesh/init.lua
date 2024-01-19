local M = {}

M.name = "dap"

M.lazy_config = { { "mfussenegger/nvim-dap", name = M.name }, { "rcarriga/nvim-dap-ui" } }






M.setup = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_widgets = require("dap.ui.widgets")

    dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
            command = 'dlv',
            args = { 'dap', '-l', '127.0.0.1:${port}' },
        }
    }

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
        {
            type = "delve",
            name = "Debug",
            request = "launch",
            program = "${file}"
        },
        {
            type = "delve",
            name = "Debug test", -- configuration for debugging test files
            request = "launch",
            mode = "test",
            program = "${file}"
        },
        -- works with go.mod packages and sub packages
        {
            type = "delve",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}"
        }
    }



    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>dx", dap.close)

    vim.keymap.set("n", "<leader>dso", dap.step_over)
    vim.keymap.set("n", "<leader>dsi", dap.step_into)
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dh", dap_widgets.hover)
    vim.keymap.set('n', '<Leader>dr', dap.repl.open)
    vim.keymap.set('n', '<leader>dui', dapui.toggle)
    vim.keymap.set('n', '<leader>dux', function() dapui.eval(vim.fn.input("REPL: ")) end)

    dapui.setup()
end

return M
