return {
	"nvim-treesitter/nvim-treesitter",
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	init = function()
		require("core.utils").lazy_load_on_bufent("nvim-treesitter")
	end,
	opts = function()
		return {
			ensure_installed = {
				-- defaults
				"lua",
				"vim",

				-- General
				"markdown",
				"markdown_inline",
				"comment",
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
				use_languagetree = true,
			},
			indent = { enable = true },
		}
	end,
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
