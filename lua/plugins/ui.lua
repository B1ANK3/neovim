return {
	-- Comments
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		init = function()
			require("core.utils").load_mappings({
				-- toggle comment in both modes
				-- Comments
				-- ["<C-/>"] = { ":lua vim.notify('Commenting not implemented',3) <CR>", "Comment a line" },

				n = {
					["<C-/>"] = {
						function()
							require("Comment.api").toggle.linewise.current()
						end,
						"Toggle comment",
					},
				},

				v = {
					["<C-/>"] = {
						"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
						"Toggle comment",
					},
				},

				i = {
					["<C-/>"] = {
						function()
							require("Comment.api").toggle.linewise.current()
						end,
						"Toggle comment",
					},
				},
			})
		end,
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		opts = {
			options = {
				theme = "gruvbox-material",
			},
		},
	},

	-- LSP notification plugin (opposed to nvim-notify) [testing]
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		init = function()
			vim.api.nvim_create_user_command(
				"Notifications",
				"Fidget history",
				{ desc = "Show previous notifications" }
			)
		end,
		opts = {
			progress = {
				display = {
					done_ttl = 20, -- 20s for notification
				},
			},
			notification = {
				override_vim_notify = true,
			},
		},
	},

	{
		"petertriho/nvim-scrollbar",
		enabled = false,
		event = { "BufEnter" },
		dependencies = {
			"lewis6991/gitsigns.nvim",
		},
		opts = {
			handlers = {
				gitsigns = true,
			},
		},
	},

	-- tabs
	{
		"akinsho/bufferline.nvim",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim" },
		init = function()
			require("core.utils").load_mappings({
				n = {
					["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", "Goto next buffer" },
					["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "Goto previous buffer" },
					["<leader>x"] = {
						function()
							require("bufdelete").bufdelete(0, false)
						end,
						"Close buffer",
					},
				},
			}, {
				noremap = true,
				silent = true,
			})
		end,
		opts = {
			options = {

				mode = "buffers",
				-- style_preset = require('bufferline').style_preset.minimal,
				themable = true,

				indicator = {
					style = "icon",
				},

				diagnostics = "nvim_lsp",

				offsets = {
					-- Make neotree offset the tabs
					{
						filetype = "neo-tree",
						separator = true,
					},
					{
						filetype = "Outline",
						text = "Symbol Outline",
					},
				},
				color_icons = true,
				show_close_icon = true,
				show_duplicate_prefix = true,

				separator_style = "thin",
				enforce_regular_tabs = true,
			},
		},
	},

	-- extra features for commands
	{
		"gelguy/wilder.nvim",
		enabled = false,
		keys = { ":", "/", "?" },
		dependencies = { "roxma/nvim-yarp" },
		config = function()
			local wilder = require("wilder")

			wilder.set_option("pipeline", {
				wilder.branch(
					wilder.cmdline_pipeline({
						fuzzy = 1,
						set_pcre2_pattern = 1,
					}),
					wilder.python_search_pipeline({
						pattern = "fuzzy",
					})
				),
			})

			wilder.set_option(
				"renderer",
				wilder.renderer_mux({
					pumblend = 20,
					[":"] = wilder.popupmenu_renderer({
						highlighter = wilder.basic_highlighter(),
					}),
					["/"] = wilder.wildmenu_renderer({
						highlighter = wilder.basic_highlighter(),
					}),
				})
			)

			wilder.setup({
				modes = { ":", "/", "?" },
			})
		end,
	},

	-- Keymaps
	{
		"folke/which-key.nvim",
		keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
		cmd = { "WhichKey" },
		init = function()
			require("core.utils").load_mappings({
				n = {
					["<leader>"] = {
						function()
							vim.cmd("WhichKey")
						end,
						"Which-key all keymaps",
					},
					["<leader>wk"] = {
						function()
							local input = vim.fn.input("WhichKey: ")
							vim.cmd("WhichKey " .. input)
						end,
						"Which-key query lookup",
					},
				},
			})
		end,
	},
}
