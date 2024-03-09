local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local opts = {

  sources = {
    -- Frontend
    formatting.prettierd,

    -- Lua
    formatting.stylua,

    -- Bash
    formatting.shfmt,

    -- Python
    diagnostics.mypy.with({ filtypes = { "python" } }),
    formatting.isort.with({ filetypes = { "python" } }),
    formatting.black.with({ filetypes = { "python" } }),

    -- Go
    formatting.gofumpt.with({ filetypes = { "go " } }),
    formatting.goimports_reviser.with({ filetypes = { "go" } }),
    formatting.golines.with({ filetypes = { "go" } }),
  },

  -- Autoformat on save --
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts
