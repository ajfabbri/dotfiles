local wk = require("which-key")
local gs = require("gitsigns")
wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    t = { "<cmd>Telescope live_grep <cr>", "Find Text Pattern In All Files" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  },

  s = {
    name = "Search",
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  v = {
    name = "Git (VCS)",
    b = {function() gs.blame_line({full = true}) end, "Git Blame"},
    t = {gs.toggle_current_line_blame, "Git Toggle Blame"},
  },
}, { prefix = "<leader>" })

wk.register({
    g = {
        name = "goto / LSP",
        d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "goto definition"},
        D = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "goto Declaration"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<cr>", "goto Obj definition"},
        o = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "goto Obj definition"},
        r = {"<cmd>lua vim.lsp.buf.references()<cr>", "goto Obj definition"},
        s = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "goto Signature help"},
        l = {"<cmd>lua vim.diagnostic.open_float()<cr>", "List of diagnostics"},
    },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "prev Diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "next Diagnostic" },

})
