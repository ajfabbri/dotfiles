local wk = require("which-key")
local gs = require("gitsigns")

wk.add({
    { "<leader>f", group = "file/find/format" },
    { "<leader>fb", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "Format Buffer" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "File" },
    { "<leader>fh", "<cmd>Telescope find_files find_command=rg,--files,--no-ignore,--hidden,-g,!.git,-g,!target/**<cr>", desc = "Hidden files" },
    { "<leader>fk", "<cmd>Telescope pickers<cr>", desc = "Pickers" },
    { "<leader>fp", "<cmd>Telescope resume<cr>", desc = "Previous (resume)" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>ft", "<cmd>Telescope live_grep <cr>", desc = "Find Text Pattern In All Files" },
    { "<leader>lr", "<cmd>RustAnalyzer restart<cr>", desc = "Lsp Rust analyzer restart" },
    { "<leader>s", group = "Search" },
    { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sp", "<cmd>Telescope pickers<cr>", desc = "prev Pickers" },
    { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>v", group = "Git (VCS)" },
    { "<leader>vb", function() gs.blame_line({full = true}) end, desc = "git Blame"},
    { "<leader>vt", gs.toggle_current_line_blame, desc = "Git Toggle Blame" },
})

wk.add({
    { "<leader>[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "prev Diagnostic" },
    { "<leader>]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "next Diagnostic" },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Code Rename" },
    { "<leader>g", group = "goto / LSP" },
    { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "goto Declaration" },
    { "<leader>gc", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", desc = "goto Callers" },
    { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "goto definition" },
    { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "goto Implementation" },
    { "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "List of diagnostics" },
    { "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "goto References" },
    { "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "goto Signature help" },
    { "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "goto Type definition" },
})
