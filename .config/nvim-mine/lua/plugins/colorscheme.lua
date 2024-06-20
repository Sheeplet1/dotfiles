return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
			vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#D4D4D4" })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#569CD6" })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6" })
			vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#C586C0" })
			vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#D4D4D4" })
			vim.api.nvim_set_hl(0, "CmpItemSelected", { bg = "#3E4451", fg = "#FFFFFF" })
		end,
	},
}
