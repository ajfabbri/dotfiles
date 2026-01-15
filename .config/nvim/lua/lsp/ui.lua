local M = {}

function M.info()
  vim.print(vim.lsp.get_clients())
end

function M.log()
  vim.cmd("edit " .. vim.lsp.get_log_path())
end

return M
