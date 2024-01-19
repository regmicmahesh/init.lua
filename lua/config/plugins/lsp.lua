local functions = require("config.functions")

local M = {}

M.name = "catppuccin"

M.lazy_config = { { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason.nvim' },
    { 'L3MON4D3/LuaSnip' } }

M.setup_key_bindings = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>?", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ "n", "v" }, "<leader>lf", vim.lsp.buf.format);
    vim.keymap.set("n", "<leader>lqf", function() vim.diagnostic.setqflist({ open = false }) end, opts)
    vim.keymap.set("n", "<leader>ltv", function() functions.create_terraform_variable() end, opts)
end

M.setup_custom_configs = function(lsp)
    lsp.configure("yamlls", {
        settings = {
            yaml = {
                keyOrdering = false
            }
        }
    })

    lsp.configure("lua_ls", {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { "vim" }
                },
            }
        }
    })
end


M.required_lsp_servers = {
    "tsserver",
    "eslint",
    "rust_analyzer",
    "pyright",
    "gopls",
    "yamlls"
}



local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end



M.setup = function()
    local lsp = require("lsp-zero")
    local cmp = require('cmp');
    local mason_lsp_config = require('mason-lspconfig')
    local mason = require("mason")

    lsp.preset({ name = 'recommended', suggest_lsp_servers = false })
    lsp.extend_lspconfig()

    lsp.on_attach(M.setup_key_bindings)
    M.setup_custom_configs(lsp)

    mason.setup()
    mason_lsp_config.setup({
        ensure_installed = M.required_lsp_servers,
        handlers = {
            lsp.default_setup,
        },
    })
    lsp.setup()
    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = vim.NIL,
            ['<S-Tab>'] = vim.NIL,
            ['<CR>'] = cmp.mapping.confirm(),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end)
        })
    })
end



return M
