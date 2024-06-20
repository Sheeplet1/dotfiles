return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		event = "VeryLazy",
		init = function()
			local builtin = require("telescope.builtin")
			local wk = require("which-key")
			wk.register({
				["ff"] = { builtin.find_files, "Find File" },
				["fb"] = { builtin.buffers, "Find Buffer" },
				["fw"] = { builtin.live_grep, "Find with Grep" },
				["fh"] = { builtin.help_tags, "Find Help" },
			}, { prefix = "<leader>" })
		end,
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					vimgrep_arguments = {
						"rg",
						"-L",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					previewer = true,
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					undo = {},
				},
				extensions_list = { "ui-select", "undo" },
			}
		end,
		config = function(_, opts)
			-- dofile(vim.g.base46_cache .. "telescope")
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		event = "VeryLazy",
		config = function()
			require("telescope").load_extension("undo")
		end,
	},
}
