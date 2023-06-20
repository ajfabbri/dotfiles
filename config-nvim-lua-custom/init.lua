local opt = vim.opt

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.foldmethod = "expr"
vim.g.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.foldmethod = "expr"


-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
