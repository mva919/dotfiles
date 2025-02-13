return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files in current projcet" })
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" })
			vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Telescope find live grep" })
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "Telescope find grep search in project" })
		end,
	},
	-- this plugin is to have the telescope ui for quick fix actions like code actions for LSPs
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
