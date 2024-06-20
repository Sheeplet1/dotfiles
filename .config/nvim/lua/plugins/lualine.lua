return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function()
      -- local theme = require "lualine.themes.auto"
      local theme = require "configs.tokyonight-lualine"
      for _, mode in pairs(theme) do
        if mode.c and mode.c.bg then
          mode.c.bg = "none"
        end
      end

      return {
        options = {
          theme = theme,
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
      }
    end,
  },
}
