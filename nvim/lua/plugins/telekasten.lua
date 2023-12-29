return {
	-- https://github.com/renerocksai/telekasten.nvim
	"renerocksai/telekasten.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	opts = {
		home = vim.fn.expand("~/Documents/Notes"),
	},
}
