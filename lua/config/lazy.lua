local catppuccin         = require("config.plugins.catppuccin")
local comment            = require("config.plugins.comment")
local notify             = require("config.plugins.notify")
local sidebar            = require("config.plugins.sidebar")

-- local neotree            = require("config.plugins.neotree")
local telescope          = require("config.plugins.telescope")
local navigator          = require("config.plugins.navigator")
local dap                = require("config.plugins.dap")

local lsp                = require("config.plugins.lsp")
local null_ls            = require("config.plugins.null_ls")
local treesitter         = require("config.plugins.treesitter")

local vim_tmux_navigator = require("config.plugins.vim_tmux_navigator")

local LazyModule         = {}

function LazyModule.init()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)
end

function LazyModule.setup()
    local lazy = require("lazy")
    lazy.setup({
        { "folke/neodev.nvim", opts = {} },
        comment.lazy_config,
        catppuccin.lazy_config,
        notify.lazy_config,
        navigator.lazy_config,
        -- neotree.lazy_config,
        telescope.lazy_config,
        null_ls.lazy_config,
        navigator.lazy_config,
        vim_tmux_navigator.lazy_config,
        sidebar.lazy_config,
        treesitter.lazy_config,
        dap.lazy_config,
        unpack(lsp.lazy_config),


    })
end

return LazyModule
