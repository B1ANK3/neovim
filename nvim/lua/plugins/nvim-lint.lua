-- TODO: Do I even need a linter? Formatter has linting included depending on the formatter.
-- Linting is just for styles

-- https://github.com/mfussenegger/nvim-lint
return {
	"mfussenegger/nvim-lint",
	init = function()
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
				-- vim.notify("Linters: " .. table.concat(require("lint").get_running(), ", "), 3)
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
			typescript = { "biomejs", "typos" },
		}
	end,
}
