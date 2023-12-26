return {
	"romgrk/barbar.nvim",
	-- enabled = false,
	lazy = false,
	init = function()
		vim.g.barbar_auto_setup = false

		-- keymaps
		require("core.utils").load_mappings({
			n = {
				["<tab>"] = { "<cmd>BufferNext<CR>", "Goto next buffer" },
				["<S-tab>"] = { "<cmd>BufferPrevious<CR>", "Goto previous buffer" },
				["<leader>x"] = { "<cmd>BufferClose<CR>", "Close buffer" },
			},
		}, {
			noremap = true,
			silent = true,
		})
	end,
	config = function()
		require("barbar").setup({
			animation = true,
			autohide = false,
			tabpages = true,
			clickable = true,
			focus_on_close = "right",
			hide = {
				extensions = false,
				inactive = false,
			},
			highlight_visible = true,

			icons = {
				gitsigns = {
					added = { enabled = false, icon = "+" },
					changed = { enabled = false, icon = "~" },
					deleted = { enabled = false, icon = "-" },
				},
				filetype = {
					custom_colors = true,
					enabled = true,
				},
				separator = { left = "▎", right = "" },
				separator_at_end = true,

				-- TODO: change to a smaller dot
				modified = { button = "●" },

				preset = "default",
				current = { buffer_index = false },
				-- TODO: change button for close
				-- inactive = { button = "x" },
				visible = { modified = { buffer_number = false } },
			},

			insert_at_end = true,
			-- insert_at_start = false,

			maximum_padding = 1,
			minimum_padding = 1,
			maximum_length = 30,
			minimum_length = 0,

			sidebar_filetypes = {
				["neo-tree"] = {
					event = "BufWipeout",
				}
			},
		})
	end,
}
