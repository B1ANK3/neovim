return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- luasnip snippets
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_snipmate").load()
				require("luasnip.loaders.from_lua").load()
			end,
		},

		{
			"windwp/nvim-autopairs",
			opts = {
				fast_wrap = {},
				disable_filetype = { "TelescopePrompt", "vim" },
			},
			config = function(_, opts)
				require("nvim-autopairs").setup(opts)

				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end,
		},

		-- sources
		{
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua", -- nvim lua autocomplete
			"JMarkin/cmp-diag-codes",
			"FelipeLema/cmp-async-path",
		},
	},
	config = function()
		local luasnip = require("luasnip")
		local cmp = require("cmp")

		cmp.setup({

			completion = { completeopt = "menu,menuone,noinsert" },

			enabled = function()
				-- disable cmp in comments
				local context = require("cmp.config.context")
				if vim.api.nvim_get_mode().mode == "c" then
					return true
				else
					return not context.in_treesitter_capture("comment") and not context.in_syntax_group("comment")
				end
			end,

			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete({
					behaviour = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<CR>"] = cmp.mapping.confirm({
					behaviour = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<C-q>"] = cmp.mapping.abort(),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ behaviour = cmp.ConfirmBehavior.Insert })
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer", keyword_length = 4 },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "async_path", option = { trailing_slash = true } },
				{ name = "diag-codes", option = { in_comment = true } },
			}),
		})
	end,
}
