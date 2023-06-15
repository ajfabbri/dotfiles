vim.opt.vb = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.foldmethod = syntax
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.tw = 80
vim.opt.colorcolumn = 80
vim.opt.colorscheme = "desert256"

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Idle timeout also used to detect hover, trigger LSP
vim.opt.updatetime = 100

vim.opt.ttimeoutlen = 10
vim.cmd([[
highlight ExtraWhitespace ctermbg=lightgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/
]])
