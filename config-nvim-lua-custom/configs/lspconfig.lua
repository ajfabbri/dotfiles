local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = util.root_pattern("Cargo.toml", "rust-project.json")
--   settings = {
--     ["rust_analyzer"] =  {
--       cargo = {
--         allFeatures = true,
--       }
--     }
--   }
-- })
-- 
-- lspconfig.pyright.setup { blabla}
