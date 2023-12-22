return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
	init = function()
		-- mason mappings

		-- Mason ensure binaries installed
		local ensure_installed = {
			-- nvim defaults
			"lua-language-server",
			"stylua",
		}

		vim.g.mason_ensure_installed = ensure_installed
	end,
	config = function()
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonInstall " .. table.concat(vim.g.mason_ensure_installed, " "))
		end, {})

		require("mason").setup({
			PATH = "append",

			ui = {
				icons = {
					package_pending = " ",
					package_installed = "󰄳 ",
					package_uninstalled = " 󰚌",
				},

				keymaps = {
					toggle_server_expand = "<CR>",
					install_server = "i",
					update_server = "u",
					check_server_version = "c",
					update_all_servers = "U",
					check_outdated_servers = "C",
					uninstall_server = "X",
					cancel_installation = "<C-c>",
				},
			},

			max_concurrent_installers = 10,
		})
	end,
}
