return {

  -- uncomment and add tools to ensure_installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "marksman",
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- disable the fancy UI for the debugger
  { "rcarriga/nvim-dap-ui",                     enabled = false },

  -- which key integration
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>dw"] = { name = "+widgets" },

      },
    },
  },

  -- custom language specific extension modules
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.python" },
--  { import = "plugins.extras.lang.clangd" },
  --  { import = "plugins.extras.lang.nodejs" },
}
