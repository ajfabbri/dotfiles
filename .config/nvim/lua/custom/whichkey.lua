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
