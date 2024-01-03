local M = {}

M.name = "Comment"

M.lazy_config = { "numToStr/Comment.nvim", name = M.name }


M.setup = function()
    local comment = require("Comment")
    comment.setup()
end

return M
