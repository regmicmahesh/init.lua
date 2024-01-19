require("config")


local local_config = vim.fn.getcwd() .. "/.nvim/init.lua"

local f = io.open(local_config, "r")

if (f) then
    vim.cmd.normal("source " .. local_config)
end

