local options = {
  panel = {
    auto_refresh = false,
    keymap = {
      accept = "<CR>",
      jump_prev = "[[",
      jump_next = "]]",
      refresh = "gr",
      open = "<M-CR>",
    },
  },

  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<M-l>",
      prev = "<M-[>",
      next = "<M-]>",
      dismiss = "<C-]>",
    },
  },

  filetypes = {
    yaml = false,
    markdown = false,
  },
}

require("copilot").setup(options)
