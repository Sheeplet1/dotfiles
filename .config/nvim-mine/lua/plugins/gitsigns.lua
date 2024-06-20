return {
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		config = function(_, opts)
			return require("plugins.configs.others").gitsigns.setup(opts)
		end,
	},
}
