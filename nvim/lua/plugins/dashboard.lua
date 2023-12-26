return {
	"nvimdev/dashboard-nvim",
	--enabled = false,
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"MaximilianLloyd/ascii.nvim",
			dependencies = { "MunifTanjim/nui.nvim" },
		},
	},
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				-- header = require("ascii").get_random_global(),
				shortcut = {
					{
						desc = "Sessions",
						group = "@function",
						action = "SearchSession",
						key = "s"
					},
					{
						desc = "Lazy Update",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
					{
						desc = "Config",
						group = "Number",
						action = "Telescope find_files cwd=" .. vim.fn.stdpath("config"),
						key = "c",
					},
				},
			},
			hide = {
				statusline = false,
				tabline = true,
				winbar = true,
			},
		})
	end,
}
