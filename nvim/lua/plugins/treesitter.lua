return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "lua" },
				auto_install = true,
				highlight = { enabled = true },
				indent = { enabled = true },
			})
		end,
	},
	{
		"nvim-treesitter/playground",
		config = function()
			vim.keymap.set("n", "<leader>tsp", "<Cmd>TSPlayground<CR>", { desc = "Toggle TSPlayground" })
		end,
	},
}
