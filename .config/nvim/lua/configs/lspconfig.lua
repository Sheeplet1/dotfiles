local nvchad_on_attach = require("nvchad.configs.lspconfig").on_attach
local on_attach = function(client, bufnr)
  nvchad_on_attach(client, bufnr)
  -- extend on_attach here
end

local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local util = require "lspconfig/util"

local lspconfig = require "lspconfig"
local servers = {
  -- python
  "basedpyright",
  "ruff",

  -- frontend shenanigans
  "html",
  "cssls",
  "tsserver",
  "eslint",
  "tailwindcss",

  -- bash
  "bashls",

  -- go
  "gopls",

  -- cpp
  "clangd",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

----------------------------------- frontend -----------------------------------

local function organise_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
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
}

lspconfig.eslint.setup {
  on_attach = function(_, bufnr)
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
}

-------------------------------------- go --------------------------------------

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
}

lspconfig.basedpyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "standard",
      },
    },
  },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--fallback-style=webkit",
  },
}
