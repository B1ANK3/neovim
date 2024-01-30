return {
	"kevinhwang91/nvim-bqf",
	enabled = false,
	dependencies = {
		{
			"junegunn/fzf",
			build = function()
				vim.fn["fzf#install"]()
			end,
		},
		"nvim-treesitter/nvim-treesitter",
	},
	init = function()
		require("core.utils").load_mappings({})
	end,
	config = function()
		-- vim.notify("nvim-bqf is not correctly setup", 4)

		require("bqf").setup({
			auto_enable = true,
			auto_resize_height = true,
		})
	end,
}
