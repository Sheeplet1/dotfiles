-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyonight",
  statusline = { theme = "minimal", separator_style = "round" },
  telescope = { style = "bordered" },
  lsp = {
    signature = false,
  },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true ,
  -- },
}

M.base46 = {
  integrations = {
    "cmp",
    "todo",
    "telescope",
    "rainbowdelimiters",
    "mason",
  },
}

return M
