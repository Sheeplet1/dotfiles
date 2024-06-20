return {
  {
    "echasnovski/mini.surround",
    version = false,
    event = "BufEnter",
    config = function()
      require("mini.surround").setup {}
    end,
  },
}
