local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
  "pyright",

  -- WebDev --
  "html",
  "cssls",
  "tsserver",
  "eslint",
  "tailwindcss",

  -- Bash
  "bashls",

  -- go
  "gopls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

------------------------------- organise imports -------------------------------

local function organise_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

----------------------------------- frontend -----------------------------------
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    separate_diagnostic_server = true,
    public_diagnostic_on = "insert_leave",
    tsserver_plugins = {},
  },
  commands = {
    OrganiseImports = {
      organise_imports,
      description = "Organise Imports",
    },
  },
})

lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = lspconfig.util.root_pattern(
    ".eslintrc.js",
    ".eslintrc.json",
    ".eslintrc.yml",
    ".eslintrc.yaml",
    "package.json"
  ),
})

-------------------------------------- go --------------------------------------

lspconfig.gopls.setup({
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})
