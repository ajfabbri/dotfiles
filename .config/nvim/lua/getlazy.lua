local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
-- plugins
"tpope/vim-fugitive",
"neovim/nvim-lspconfig",
"williamboman/nvim-lsp-installer",
"tami5/lspsaga.nvim",
--  use 'onsails/lspkind.nvim' -- icons in autocomplete source
"hrsh7th/nvim-cmp", -- autocomplete engine (see autocomplete.lua
"hrsh7th/cmp-nvim-lsp", -- LSP source for cmp
"hrsh7th/cmp-buffer", -- buffer source for cmp
"hrsh7th/cmp-path", -- path source for cmp
"rust-lang/rust.vim",
"nvim-tree/nvim-web-devicons",
{"Vimjas/vim-python-pep8-indent", ft = "python"},
{ import = "plugins" }
})


-- TODO plugins to check out
-- gitsigns.nvim
-- 'scrooloose/nerdcommenter' -- commenting shortcuts

  -- search
--  use 'tpope/vim-eunuch' -- wrappers UNIX commands
--  use 'tpope/vim-surround' -- surround characters shortcuts

