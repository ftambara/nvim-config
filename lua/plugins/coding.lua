return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"lazy.nvim",
			},
		},
	},
	{
		"tpope/vim-fugitive",
		keys = {
			{"<leader>gs", "<cmd>Git<cr>", mode = "n"},
		},
	},
}
