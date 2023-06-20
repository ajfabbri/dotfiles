local on_attach = require("plugins.configs.treesitter").on_attach
local capabilities = require("plugins.configs.treesitter").capabilities


local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  ensure_installed = { 'c', 'cpp', 'rust'},
}

return options
