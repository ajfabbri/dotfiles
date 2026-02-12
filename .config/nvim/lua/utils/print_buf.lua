local M = {}

--- Prints any Lua value to a scratch buffer (searchable & scrollable)
---@param ... any
function M.print_buf(...)
    local lines = {}
    for i = 1, select("#", ...) do
        local arg = select(i, ...)
        local str = vim.inspect(arg)
        for s in str:gmatch("[^\r\n]+") do
            table.insert(lines, s)
        end
    end

    -- Create a new scratch buffer
    local buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch=true]
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Open in a new split (you can change to vsplit or floating window)
    vim.cmd("botright split")
    vim.api.nvim_win_set_buf(0, buf)

    -- Optional: set buffer options
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false
    vim.bo[buf].filetype = "lua" -- syntax highlighting for tables
end

return M

