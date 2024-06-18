return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function()
      local auto_theme_custom = require "lualine.themes.auto"
      auto_theme_custom.normal.c.bg = "none"
      return {
        options = {
          theme = auto_theme_custom,
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
      }
    end,
  },
}
