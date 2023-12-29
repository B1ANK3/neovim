return {
	"nvim-treesitter/nvim-treesitter",
	-- lazy = false,
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	init = function()
		require("core.utils").lazy_load_on_bufent("nvim-treesitter")
	end,
	opts = {
		ensure_installed = {
			"lua",
			"vim",

			-- General
			"markdown",
			"markdown_inline",
			-- "comment",
			"csv",

			-- docs
			"doxygen",
			"ninja",
			"yaml",

			-- regulars
			"sql",
			"r",
			"kotlin",
			"go",
			"typescript",

			-- low-level
			"c",
			"cmake",
			"zig",
			"nasm",
			"cuda",

			-- Web dev
			"html",
			"css",
			"scss",
			"javascript",
			"tsx",
			"json",
			"json5",
			"vue",
			"svelte",
		},

		highlight = {
			enable = true,
			use_languagetree = false,
			additional_vim_regex_highlighting = false,
		},

		indent = {
			enable = false,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		require("vim.treesitter.query").set("lua", "injections", "(comment) @comment")
	end,
}
