return {
	{
		"folke/which-key.nvim",
		opts = {},
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Telescope buffers" })
		end,
	},
	{
		"mbbill/undotree",
		lazy = false,
		keys = {
			{"<leader>u", vim.cmd.UndotreeToggle, mode = "n"},
		},
	},
	"airblade/vim-gitgutter",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local harpoon = require("harpoon")

			harpoon.setup({})

			vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
			vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

			vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
			vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
			vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
			vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
		end,
	},
}
