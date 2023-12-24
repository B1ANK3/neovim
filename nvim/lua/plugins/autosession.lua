return {
	{
		"rmagatti/auto-session",
		cmd = { "SessionSave", "SessionRestore", "SessionRestoreFromFile", "SessionDelete", "Autosession" },
		config = function()
			-- https://github.com/romgrk/barbar.nvim#integrations
			require("auto-session").setup({
				log_level = vim.log.levels.ERROR,
				auto_session_suppress_dirs = { "/", "~/", "~/Downloads" },
				auto_save_enabled = true,
				auto_restore_enabled = true,
				auto_session_enable_last_session = false, -- vim.loop.cwd() == vim.loop.os_homedir(),
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
