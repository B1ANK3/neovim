return {
	"mhartington/formatter.nvim",
	cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },
	init = function()
		-- Removed because having it format after exiting or deleting is annoying
		-- Rather use a bind to format
		--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		--	group = vim.api.nvim_create_augroup("__formatter__", { clear = true }),
		--	command = ":FormatWrite",
		--})
		require("core.utils").load_mappings({
			n = {
				["<leader>fm"] = {
					"<cmd>FormatWrite<CR>",
					"Format the current file",
				},
			},
		})
	end,
	opts = function() 
		return {		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {

			-- TODO: Make another config file just for setting this.
			-- I want the configs to be easy to navigate and 'Just work^TM'
			-- Any opt in or custom config should be in another folder/file
			-- For now, im enabling most features that i use so i wont have
			-- to touch this config until i need something else
			c = {
				require("formatter.filetypes.c").clangformat,
			},
			cmake = {
				require("formatter.filetypes.cmake").cmakeformat,
			},
			cpp = {
				require("formatter.filetypes.cpp").clangformat,
			},
			css = {
				require("formatter.filetypes.css").prettier,
			},
			go = {
				require("formatter.filetypes.go").gofmt,
			},
			html = {
				require("formatter.filetypes.html").prettier,
			},
			java = {
				require("formatter.filetypes.java").clangformat,
			},
			javascript = {
				require("formatter.filetypes.javascript").prettier,
			},
			json = {
				require("formatter.filetypes.json").prettier,
			},
			kotlin = {
				require("formatter.filetypes.kotlin").ktlint,
			},
			latex = {
				require("formatter.filetypes.latex").latexindent,
			},
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			markdown = {
				require("formatter.filetypes.markdown").prettier,
			},
			proto = {
				require("formatter.filetypes.proto").buf_format,
			},
			python = {
				require("formatter.filetypes.python").black,
			},
			r = {
				require("formatter.filetypes.r").styler,
			},
			rust = {
				require("formatter.filetypes.rust").rustfmt,
			},
			sh = {
				require("formatter.filetypes.sh").shfmt,
			},
			sql = {
				require("formatter.filetypes.sql").sqlfluff,
			},
			svelte = {
				require("formatter.filetypes.svelte").prettier,
			},
			toml = {
				require("formatter.filetypes.toml").taplo,
			},
			-- Formatter is opt in
			-- Add the filetype and import the default config or create a custom one
			-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
			typescript = {
				require("formatter.filetypes.typescript").prettier,
			},
			vue = {
				require("formatter.filetypes.vue").prettier,
			},
			yaml = {
				require("formatter.filetypes.yaml").yamlfmt,
			},
			zig = {
				require("formatter.filetypes.zig").zigfmt,
			},

			-- All files that don't have a config above
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	} end
}
