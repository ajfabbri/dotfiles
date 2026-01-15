return {
        root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
        cmd = { 'clangd', '--background-index', '--clang-tidy'},
        --, {'--completion-style=detailed', '--header-insertion=never' },
    --root_dir = function(fname)
    --    return vim.fs.root(fname, { "compile_commands.json", ".git" })
    --end,
}
