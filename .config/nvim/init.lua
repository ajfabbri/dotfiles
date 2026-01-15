local vim = vim
vim.g.mapleader = ' '
vim.wo.relativenumber = true
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel = 99

vim.lsp.set_log_level("info")
-- highlight trailing whitespace
-- TODO this--if it would higlight Errors, and remove better whitespace dependency
-- vim.fn.matchadd('errorMsg', [[\s\+$]])

-- Detect .avsc files as JSON
vim.cmd([[autocmd BufRead,BufNewFile *.avsc set filetype=json]])

-- lazy.nvim bootstrap
import = 'lsp'
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
    -- color schemes
    { 'folke/tokyonight.nvim' },
    { 'gilgigilgil/anderson.vim' },
    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            -- your optional config goes here, see below.
        end,
    },
    { 'ntpeters/vim-better-whitespace' },
    -- treesitter
    {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    -- LSP Support
    { 'williamboman/mason.nvim' },
    --{ 'williamboman/mason-lspconfig.nvim' },
    --{ 'neovim/nvim-lspconfig' },

    -- Rust-specific
    { 'mrcjkb/rustaceanvim',              version = '^6',  lazy = false, }, -- This plugin is already lazy

    -- Java
    { 'mfussenegger/nvim-jdtls' },

    -- Autocompletion and snippets
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    --{ 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    --{ 'hrsh7th/cmp-cmdline' },

    -- preferred snip impl w/ lsp-zero
    -- { 'L3MON4D3/LuaSnip' },
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
        tag = '0.1.8',
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
    -- Comment.nvim
    { "numToStr/Comment.nvim", },
    -- figlet.nvim
    {
        "pavanbhat1999/figlet.nvim",
		dependencies = "numToStr/Comment.nvim",
    },
})

-- Configuration

-- context-sensitive mappings
require('custom.java')

-- additional key mappings
require('custom.whichkey')

-- TODO no longer should need lsp-zero.
-- lsp-zero
-- local lspz = require('lsp-zero').preset({})
-- lspz.set_sign_icons({
--     error = '✘',
--     warn = '▲',
--     hint = '⚑',
--     info = '»'
-- })
--
-- lspz.on_attach(function(_client, bufnr)
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     lspz.default_keymaps({ buffer = bufnr })
--     -- Defaults:
--     -- K lsp hover
--     -- gd	goto definition
--     -- gD goto declaration
--     -- gi list implementations
--     -- go goto type definition of obj under cursor
--     -- gr list references
--     -- gs list signature
--     -- gl Show diagnostics floating window
--     -- [d goto previous diag.
--     -- ]d goto next diag.
-- end)

vim.g.rustaceanvim = {
    server = {
        -- see also rust-analyzer.json in project root
        default_settings = {
            ['rust-analyzer'] = {
            }
        }
    }
}

-- git signs
require('gitsigns').setup()

-- mason
require('mason').setup()

-- copilot
require('copilot').setup({
    suggestion = { enabled = true },
    panel = { enabled = true },
    filetypes = {
        markdown = true,
        typescript = true,
        javascript = true,
        java = true,
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
cmp.setup({
    sources = {
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'path' },
    },
    --formatting = cmp_format,
    mapping = cmp.mapping.preset.insert({
        -- Scroll doc window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})

--  _     ____  ____
-- | |   / ___||  _ \
-- | |   \___ \| |_) |
-- | |___ ___) |  __/
-- |_____|____/|_|

-- Defaults
local caps = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('*', {
    root_markers = { '.git' },
    capabilities = caps,
})

local lsps = {
--    { "rust_analyzer" },
    { "arduino_language_server" },
    { "clangd", },
    { "jdtls" },
    { "lua_ls" },
    { "pyright" },
    { "ts_ls" },
}

local function try_require(path)
    local ok, mod = pcall(require, path)
    if ok then return mod end
    vim.notify("Could not load module: " .. path .. " -> " .. tostring(mod), vim.log.levels.WARN)
    return nil
end

local function notify(msg)
    vim.notify("[LSP] " .. msg, vim.log.levels.INFO)
end

for _, entry in pairs(lsps) do
    local name, inline = entry[1], entry[2]

    -- Try inline config first
    local config = inline

    -- If no inline config, try ~/.config/nvim/lua/lsp/<name>.lua
    if not config then
        config = try_require("lsp." .. name)
        -- notify(" load lsp." .. name .. " -> ")

        if config then
            for k, v in ipairs(config) do
                notify("     " .. k .. ": " .. tostring(v))
            end
        end
    end

    -- If we found a config (inline or file), register it
    if config then
        vim.lsp.config(name, config)
    end

    -- Enable the server (with config or defaults)
    notify("Enabled " .. name)
    vim.lsp.enable(name)
end

vim.api.nvim_create_user_command("LspInfo", function()
  require("lsp.ui").info()
end, {})

vim.api.nvim_create_user_command("LspLog", function()
  require("lsp.ui").log()
end, {})


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
-- Comment.nvim
require('Comment').setup()
-- figlet.nvim
-- require('figlet').Config({
-- font = '3d',
-- })

-- General options
vim.opt.termguicolors = true
--vim.cmd.colorscheme('tokyonight')
vim.cmd.colorscheme('bluloco')
-- better whitespace trim on sae
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0

-- style defaults
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
