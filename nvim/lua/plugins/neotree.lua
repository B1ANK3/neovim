return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = { "Neotree" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	init = function()
		require("core.utils").load_mappings({
			n = {
				["<C-e>"] = {
					"<cmd> Neotree focus <CR>",
					"Focus Neotree",
				},
				["<C-n>"] = {
					"<cmd> Neotree toggle <CR>",
					"Toggle Neotree",
				},
			},
		})
	end,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = false,
			popup_border_style = "round",
			enable_git_status = true,
			enable_diagnostics = true,
			enable_normal_mode_for_inputs = false,

			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			sort_case_sensitive = false,

			default_component_configs = {
				container = {
					enable_character_fade = true,
				},

				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},

				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
			},

			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
				filtered_items = {
					visible = true,
					hide_hidden = false,
					hide_dotfiles = false,
					hide_gitignore = false,
					hide_by_name = {
						"node_modules",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
				},
			},

			window = {
				position = "left",
				width = 36,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {},
			},

			buffers = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
			},
		})
	end,
}
