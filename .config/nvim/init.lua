local vim = vim
local opt = vim.opt
vim.g.mapleader = ' '
vim.wo.relativenumber = true
opt.foldmethod = "syntax"

-- highlight trailing whitespace
-- TODO this--if it would higlight Errors, and remove better whitespace dependency
-- vim.fn.matchadd('errorMsg', [[\s\+$]])

-- Detect .avsc files as JSON
vim.cmd([[autocmd BufRead,BufNewFile *.avsc set filetype=json]])

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop
if not uv.fs_stat(lazypath) then
    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
    print('Done.')
end

vim.opt.rtp:prepend(lazypath)
-- end lazy.nvim bootstrap

-- Plugins
require('lazy').setup({
    { 'folke/tokyonight.nvim' },
    { 'ntpeters/vim-better-whitespace' },
    -- lspzero
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x', },
    -- LSP Support
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },

    -- Autocompletion and snippets
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    --{ 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    --{ 'hrsh7th/cmp-cmdline' },

    -- preferred snip impl w/ lsp-zero
    {'L3MON4D3/LuaSnip'},
    --{ 'onsails/lspkind-nvim' },

    -- whichkey
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
        }
    },
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- gitsigns
    { "lewis6991/gitsigns.nvim", },
    -- nvim-lint
    { "mfussenegger/nvim-lint", },
    -- copilot
    { "zbirenbaum/copilot.lua", },
    { "zbirenbaum/copilot-cmp", },
    -- neoformat
    { "sbdchd/neoformat", },
})

-- Configuration

-- additional key mappings
require('custom.whichkey')

-- lsp-zero
local lspz = require('lsp-zero').preset({})
lspz.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lspz.on_attach(function(_client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lspz.default_keymaps({ buffer = bufnr })
    -- Defaults:
    -- K lsp hover
    -- gd	goto definition
    -- gD goto declaration
    -- gi list implementations
    -- go goto type definition of obj under cursor
    -- gr list references
    -- gs list signature
    -- gl Show diagnostics floating window
    -- [d goto previous diag.
    -- ]d goto next diag.
end)

lspz.setup_servers({'tsserver', 'rust_analyzer'})
require 'lspconfig'.clangd.setup {
    cmd = { "clangd-15" },
}
lspz.setup()
-- end lsp-zero setup

-- git signs
require('gitsigns').setup()

-- mason
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'tsserver', 'rust_analyzer', 'pyright' },
    handlers = {
        lspz.default_setup,
        lua_ls = function()
            local lua_opts = lspz.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        rust_analyzer = function()
            require('lspconfig').rust_analyzer.setup({})
        end,
    },
})
-- pyright
require'lspconfig'.pyright.setup{}

-- copilot
require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
        markdown = true,
        typescript = true,
        javascript = true,
        rust = true,
        c = true,
        cpp = true,
        python = true,
        lua = true,
        go = true,
        yaml = true,
        sh = function()
            if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), '^%.env.*') then
                -- disable for .env files
                return false
            end
            return true
        end,
    },
})
require('copilot_cmp').setup()

-- neoformat
vim.g.neoformat_try_node_exe = 1

-- CMP
local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()
cmp.setup({
    sources = {
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'path' },
    },
    formatting = cmp_format,
    mapping = cmp.mapping.preset.insert({
        -- Scroll doc window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
    }),
})

-- nvim-lint
require('lint').linters_by_ft = {
    python = { 'flake8' },
    typescript = { 'eslint' },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- lualine
require('lualine').setup {
    sections = {
        lualine_c = { { 'filename', path = 3, } },
    }
}

-- General options
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
