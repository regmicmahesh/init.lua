local M = {}

M.name = "notify"

M.lazy_config = { "rcarriga/nvim-notify", name = M.name }


M.setup = function()
    local notify = require("notify")
    vim.notify = notify
end

return M
