return {
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "BufEnter",
    config = function()
      require("mini.pairs").setup {}
    end,
  },
  {
    "echasnovski/mini.surround",
    version = false,
    event = "BufEnter",
    config = function()
      require("mini.surround").setup {}
    end,
  },
}
