local keybindings = require("config.keybindings")
local globals     = require("config.globals")

local lazy        = require("config.lazy")

local catppuccin  = require("config.plugins.catppuccin")
local comment     = require("config.plugins.comment")
local notify      = require("config.plugins.notify")
local sidebar     = require("config.plugins.sidebar")

-- local neotree     = require("config.plugins.neotree")
local navigator   = require("config.plugins.navigator")
local dap  = require("config.plugins.dap")
local telescope   = require("config.plugins.telescope")

local treesitter  = require("config.plugins.treesitter")
local null_ls     = require("config.plugins.null_ls")
local lsp         = require("config.plugins.lsp")



lazy.init()
lazy.setup()

globals.setup()
keybindings.setup()

catppuccin.setup()
notify.setup()
comment.setup()


-- Provided by sidebar.nvim
-- neotree.setup()

navigator.setup()
dap.setup()
telescope.setup()


treesitter.setup()
lsp.setup()
null_ls.setup()

sidebar.setup()
