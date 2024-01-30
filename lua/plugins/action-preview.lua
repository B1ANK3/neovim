-- FIXME: Problems with not attaching to buffer when an LSP server is unavailable
-- Can't reliably replicate
return {
	"aznhe21/actions-preview.nvim",
	enabled = false,
	dependencies = { "nvim-telescope/telescope.nvim" },
	keys = { "<leader>ca" },
	init = function()
		-- Move actions-preview to nvim-lsp bindings as a dependency
		vim.api.nvim_create_autocmd({ "LspAttach" }, {
			group = vim.api.nvim_create_augroup("UserLspConfig_actions", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }
				require("core.utils").load_mappings({
					n = {
						["<leader>ca"] = { require("actions-preview").code_actions, "Lsp show code actions" },
					},

					v = {
						["<leader>ca"] = { require("actions-preview").code_actions, "Lsp show code actions" },
					},
				}, opts)
			end,
		})
	end,
	opts = {
		backend = { "telescope" },
	},
}
