vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { { 'nvim-lua/plenary.nvim' } } }
    use { "catppuccin/nvim", as = "catppuccin" }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use { "mbbill/undotree" }


    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }


    use { "github/copilot.vim" }

    use { "jose-elias-alvarez/null-ls.nvim" }


    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    use {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup()
        end
    }

    use { 'nyngwang/NeoZoom.lua' }


    use { "numToStr/Comment.nvim" }

    use { "mg979/vim-visual-multi" }

    use { "https://gitlab.com/schrieveslaach/sonarlint.nvim.git", as = "sonarlint", cond = true, config = function()
        require('sonarlint').setup({
            server = {
                cmd = {
                    'sonarlint-language-server',
                    '-stdio',
                    '-analyzers',
                    vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
                    vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
                    vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
                    vim.fn.expand("$MASON/share/sonarlint-analyzers/sonariac.jar"),
                }
            },
            filetypes = {
                'python',
                'go',
                'javascript',
                'javascriptreact',
                'typescript',
                'typescriptreact',
                'terraform',

            }
        })
    end,
    }
    use { "christianrondeau/vim-base64" }
end)
