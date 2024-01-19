local M = {}

M.create_terraform_variable = function()
    local curr_word = vim.fn.expand("<cword>")

    local curr_buff = vim.api.nvim_get_current_buf()
    local buff_name = vim.api.nvim_buf_get_name(curr_buff)

    local curr_folder = vim.fn.fnamemodify(buff_name, ":h")
    local variables_file = vim.fn.resolve(curr_folder .. "/" .. "variables.tf")

    vim.loop.fs_open(variables_file, "a", 420, function(err, fd)
        if err ~= nil then
            vim.notify("Failed")
            vim.notify(err)
        end

        fd = fd or 0

        vim.loop.fs_write(fd, 'variable "' .. curr_word .. '" {}' .. '\n')
        vim.loop.fs_close(fd)
        vim.notify("Added your entry.")
    end)

    vim.diagnostic.reset()
end


vim.keymap.set("n", "<leader>ltv", function() M.create_terraform_variable() end, {})

return M
