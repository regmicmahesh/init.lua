local M = {}

M.name = "null-ls"

M.lazy_config = { "jose-elias-alvarez/null-ls.nvim" }


M.setup = function()
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.terraform_fmt,
            null_ls.builtins.formatting.shfmt,
        }
    })
end

return M
