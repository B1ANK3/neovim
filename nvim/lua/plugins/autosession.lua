return {
	"rmagatti/auto-session",
	cmd = { "SessionSave", "SessionRestore", "SessionRestoreFromFile", "SessionDelete", "Autosession" },
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	init = function() end,
	config = function()
		require("auto-session").setup({
			log_level = vim.log.levels.ERROR,
			auto_session_suppress_dirs = { "/", "~/", "~/Downloads" },
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_enable_last_session = false,

			session_lens = {
				buftypes_to_ignore = {
					-- "neo-tree"
				},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},

			pre_save_cmds = {
				"Neotree close"
			}
		})

		require("telescope").load_extension("session-lens")
	end,
}
