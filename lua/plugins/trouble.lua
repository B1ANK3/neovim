return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	init = function()
		require("core.utils").load_mappings({
			n = {
				["<leader>tx"] = {
					function()
						require("trouble").toggle()
					end,
					"Toggle code problems",
				},

				["<leader>tw"] = {
					function()
						require("trouble").toggle("workspace_diagnostics")
					end,
					"Toggle workspace diagnostics",
				},

				["<leader>td"] = {
					function()
						require("trouble").toggle("document_diagnostics")
					end,
					"Toggle document diagnostics",
				},

				["<leader>tq"] = {
					function()
						require("trouble").toggle("quickfix")
					end,
					"Toggle code quickfix",
				},

				["<leader>tl"] = {
					function()
						require("trouble").toggle("loclist")
					end,
					"Toggle code problem locations list",
				},

				["<leader>tr"] = {
					function()
						require("trouble").toggle("lsp_references")
					end,
					"Toggle LSP references",
				},
			},
		})
	end,
}
