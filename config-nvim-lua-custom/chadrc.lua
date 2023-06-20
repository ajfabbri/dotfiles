---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"


return M
