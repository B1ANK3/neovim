return {
	{
		-- https://github.com/mfussenegger/nvim-lint
		"mfussenegger/nvim-lint",
		enabled = false,
		event = {"BufWrite"},
		init = function()
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
					-- vim.notify("Linters: " .. table.concat(require("lint").get_running(), ", "), 2)
				end,
			})
		end,
		config = function()
			require("lint").linters_by_ft = {
				-- typos is a spell checker
				-- TODO: move typos to its own spellcheck plugin
				c = { "cpplint", "cspell", "typos" },
				cpp = { "cpplint", "cspell", "typos" },
				lua = { "luacheck", "typos" },
				typescript = { "prettier", "typos" },
			}
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-lint" },
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = { "luacheck" },
				automatic_installation = true,
			})
		end,
	},
}
