vim.g.mapleader = ' '
vim.wo.relativenumber = true

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
    -- lspzero
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x', },
    -- LSP Support
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
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
    -- rust tools
    { "simrat39/rust-tools.nvim", },
    -- gitsigns
    { "lewis6991/gitsigns.nvim", },
    -- copilot
    { "zbirenbaum/copilot.lua", },
    { "zbirenbaum/copilot-cmp", },
})

-- Configuration

-- additional key mappings
require('custom.whichkey')

-- lsp-zero
local lsp = require('lsp-zero')
lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

lsp.on_attach(function(_client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opt = { buffer = true }
    lsp.default_keymaps({ buffer = bufnr })
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
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opt)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opt)
    vim.keymap.set({ 'n', 'x' }, '<leader>fb', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opt)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opt)
end)

lsp.setup_servers({'tsserver', 'rust_analyzer'})
-- end lsp-zero setup

-- rust tools
local rust_tools = require('rust-tools')
rust_tools.setup({
    server = {
        on_attach = function(_client, bufnr)
            vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
    },
})

-- git signs
require('gitsigns').setup()

-- mason
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'tsserver', 'rust_analyzer' },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        -- let rust-tools do this part
        rust_analyzer = function() end
    },
})

-- copilot
require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})
require('copilot_cmp').setup()

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

-- More LSP stuff
require 'lspconfig'.clangd.setup {
    cmd = { "clangd-15" },
}

-- lualine
require('lualine').setup()

-- General options
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
