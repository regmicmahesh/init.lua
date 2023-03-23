local neozoom = require("neo-zoom")

neozoom.setup {
    winopts = {
        offset = {
            width = 150,
            height = 0.85,
        },
    },
    exclude_buftypes = { 'terminal' },
    presets = {
        {
            filetypes = { 'dapui_.*', 'dap-repl' },
            config = {
                top = 0.25,
                left = 0.6,
                width = 0.4,
                height = 0.65,
            },
            callbacks = {
                function() vim.wo.wrap = true end,
            },
        },
    },
}

vim.keymap.set('n', '<CR>', function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
