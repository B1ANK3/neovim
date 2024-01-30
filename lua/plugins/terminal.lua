local function terminal(command)
	return function()
		require("nvterm.terminal").toggle(command)
	end
end

local function key_map(key, func, mode, desc)
	return {
		key,
		func,
		mode = mode,
		desc = desc,
		noremap = true,
		silent = true,
	}
end

return {
	-- NvChads terminal has support for dynamic sizing of terminals next to buffers
	-- Toggle terminal doesn't work correctly with nvim_win_get_width(0) as the window is not the correct size
	-- I suspect this is because toggleterm creates an empty buffer thats not shown and then renders when taking control
	-- correcting the size
	{
		"NvChad/nvterm",
		keys = {
			key_map("<A-h>", terminal("horizontal"), "n", "Toggle horizontal terminal"),
			key_map("<A-h>", terminal("horizontal"), "t", "Toggle horizontal terminal"),

			key_map("<A-v>", terminal("vertical"), "n", "Toggle vertical terminal"),
			key_map("<A-v>", terminal("vertical"), "t", "Toggle vertical terminal"),

			key_map("<A-i>", terminal("float"), "n", "Toggle floating terminal"),
			key_map("<A-i>", terminal("float"), "t", "Toggle floating terminal"),
		},
		opts = {
			behaviour = {
				autoclose_on_quit = {
					enabled = true,
					confirm = false,
				},
				close_on_exit = true,
				auto_insert = true,
			},
		},
		config = function(_, opts)
			require("nvterm").setup(opts)
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		enabled = false,
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
				vim.notify(require("core.utils").table_to_string(term))
				if term.direction == "horizontal" then
					vim.notify(
						"horizontal - "
							.. tostring(math.floor(vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()) * 0.3))
					)
					return math.floor(vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()) * 0.3)
				elseif term.direction == "vertical" then
					vim.notify("vertical - " .. tostring(math.floor(vim.api.nvim_win_get_width(0) * 0.5)))
					return math.floor(vim.api.nvim_win_get_width(0) * 0.5) -- make relative including sidebars
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
	},
}
