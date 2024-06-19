return {
  -- pretty ui for code-actions mainly
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },
  -- undo tree
  {
    "debugloop/telescope-undo.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "undo"
    end,
  },
}
