local lsp = require('lsp-zero')

lsp.preset({ name = 'recommended', suggest_lsp_servers = false })


lsp.ensure_installed({
    "tsserver",
    "eslint",
    "rust_analyzer",
    "pyright",
    "gopls"
})

local cmp = require('cmp');
local cmp_action = require('lsp-zero').cmp_action()

lsp.setup_nvim_cmp({
    -- completion = { autocomplete = true },
    mapping = lsp.defaults.cmp_mappings({
        ['<C-Space>'] = vim.NIL,
        ['<S-Tab>'] = vim.NIL,
        -- ['<CR>'] = cmp_action.toggle_completion(),
        ['<CR>'] = cmp.mapping.confirm(),
        -- ['<Tab>'] = cmp.mapping.confirm(),
    })
})



lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
end)
lsp.configure("yamlls", {
  settings = {
    yaml = {
      keyOrdering = false
    }
  }
})


lsp.nvim_workspace()

lsp.setup()
