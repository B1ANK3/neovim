return {
	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm" },
	init = function()
		require("core.utils").load_mappings({
			n = {
				["<A-i>"] = {
					"<cmd> ToggleTerm direction=float<CR>",
					"Toggle floating terminal",
				},
				["<A-h>"] = {
					"<cmd> ToggleTerm direction=horizontal<CR>",
					"Toggle horizontal terminal",
				},
				["<A-v>"] = {
					"<cmd> ToggleTerm direction=vertical<CR>",
					"Toggle vertical terminal",
				},
			},

			t = {
				["<A-i>"] = {
					"<cmd> ToggleTerm direction=float<CR>",
					"Toggle floating terminal",
				},
				["<A-h>"] = {
					"<cmd> ToggleTerm direction=horizontal<CR>",
					"Toggle horizontal terminal",
				},
				["<A-v>"] = {
					"<cmd> ToggleTerm direction=vertical<CR>",
					"Toggle vertical terminal",
				},
			},
		})
	end,
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.5 -- make relative including sidebars
			end
		end,
		trim_whitespace = false, -- for whitespace in terminals (python)
		hide_numbers = true,
		auto_scroll = true,
		autochdir = true,
		close_on_exit = true,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
