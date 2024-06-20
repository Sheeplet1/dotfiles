return {
  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
    opts = function()
      return require 'plugins.configs.mason'
    end,
    config = function(_, opts)
      require('mason').setup(opts)
      vim.api.nvim_create_user_command('MasonInstallAll', function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd 'Mason'
          local mr = require 'mason-registry'

          mr.refresh(function()
            for _, tool in ipairs(opts.ensure_installed) do
              local p = mr.get_package(tool)
              if not p:is_installed() then
                p:install()
              end
            end
          end)
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = require 'plugins.configs.mason',
    dependencies = { 'williamboman/mason.nvim' },
    cmd = {
      'MasonToolsInstall',
      'MasonToolsInstallSync',
      'MasonToolsUpdate',
      'MasonToolsUpdateSync',
      'MasonToolsClean',
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = function()
      require('mason-lspconfig').setup {
        -- ensure_installed = require('plugins.configs.servers').servers,
        -- automatic_installation = true,
      }
    end,
  },
}
