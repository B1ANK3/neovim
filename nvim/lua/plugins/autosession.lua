return {
	{
		"rmagatti/auto-session",
		lazy = false,
		cmd = { "SessionSave", "SessionRestore", "SessionRestoreFromFile", "SessionDelete", "Autosession" },
		init = function() end,
		config = function()
			-- https://github.com/romgrk/barbar.nvim#integrations
			require("auto-session").setup({
				log_level = vim.log.levels.ERROR,
				auto_session_suppress_dirs = { "/", "~/", "~/Downloads" },
				auto_save_enabled = true,
				auto_restore_enabled = true,
				auto_session_enable_last_session = false, -- vim.loop.cwd() == vim.loop.os_homedir(),

				-- Neotree doesn't have proper support for sessions so we close it before exiting
				pre_save_cmds = {
					"Neotree close",
				},

				post_restore_cmds = {
				},
			})
		end,
	},
	{
		"rmagatti/session-lens",
		cmd = { "SearchSession" },
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"rmagatti/auto-session",
		},
		config = function()
			require("session-lens").setup({
				load_on_startup = true,
				theme_conf = { border = true },
				previewer = false,
				-- path_display = { "shorten" },
			})
		end,
	},
}
