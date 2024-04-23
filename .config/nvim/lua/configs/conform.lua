local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    bash = { "shfmt" },
    css = { "prettierd" },
    html = { "prettierd" },
    python = { "mypy", "isort", "black" },
    go = { "gofumpt", "goimports_reviser", "golines" }
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
