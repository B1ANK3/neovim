return {
	"filipdutescu/renamer.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		require("core.utils").lazy_load_on_bufent("renamer.nvim")

		vim.api.nvim_create_autocmd({ "LspAttach" }, {
			group = vim.api.nvim_create_augroup("UserLspConfig_renamer", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }
				require("core.utils").load_mappings({
					n = {
						["<leader>ra"] = {
							function()
								require("renamer").rename()
							end,
							"LSP rename",
						},
					},

					v = {
						["<leader>ra"] = {
							function()
								require("renamer").rename()
							end,
							"LSP rename",
						},
					},

					i = {
						["<F2>"] = {
							function()
								require("renamer").rename()
							end,
							"LSP rename",
						},
					},
				}, opts)
			end,
		})
	end,
	opts = {
		title = "",
		with_popup = true,
		show_refs = true,
	},
}
