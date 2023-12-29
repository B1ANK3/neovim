return {
	"simrat39/symbols-outline.nvim",
	cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
	dependencies = {
		"mortepau/codicons.nvim",
	},
	init = function()
		-- require("core.utils").lazy_load_on_bufent("symbols-outline.nvim")
	end,
	opts = function()
		local codicons = require("codicons")

		return {
			width = 14,
			relative_width = true,
			position = "right",
			show_numbers = false,
			show_symbol_details = false,
			wrap = false,

			-- VSCode like icons
			-- https://microsoft.github.io/vscode-codicons/dist/codicon.html
			symbols = {
				File = { icon = codicons.get("symbol-file"), hl = "@text.uri" },
				Module = { icon = codicons.get("package"), hl = "@namespace" }, -- no direct
				Namespace = { icon = codicons.get("symbol-namespace"), hl = "@namespace" },
				Package = { icon = codicons.get("package"), hl = "@namespace" },
				Class = { icon = codicons.get("symbol-class"), hl = "@type" },
				Method = { icon = codicons.get("symbol-method"), hl = "@method" },
				Property = { icon = codicons.get("symbol-property"), hl = "@method" },
				Field = { icon = codicons.get("symbol-field"), hl = "@field" },
				Constructor = { icon = codicons.get("symbol-method"), hl = "@constructor" },
				Enum = { icon = codicons.get("symbol-enum"), hl = "@type" },
				Interface = { icon = codicons.get("symbol-interface"), hl = "@type" },
				Function = { icon = codicons.get("symbol-method"), hl = "@function" },
				Variable = { icon = codicons.get("symbol-variable"), hl = "@constant" },
				Constant = { icon = codicons.get("symbol-constant"), hl = "@constant" },
				String = { icon = codicons.get("symbol-string"), hl = "@string" },
				Number = { icon = codicons.get("symbol-numeric"), hl = "@number" },
				Boolean = { icon = codicons.get("symbol-boolean"), hl = "@boolean" },
				Array = { icon = codicons.get("symbol-array"), hl = "@constant" },
				Object = { icon = codicons.get("symbol-object"), hl = "@type" },
				Key = { icon = codicons.get("symbol-key"), hl = "@type" },
				Null = { icon = codicons.get("symbol-null"), hl = "@type" },
				EnumMember = { icon = codicons.get("symbol-enum-member"), hl = "@field" },
				Struct = { icon = codicons.get("symbol-structure"), hl = "@type" },
				Event = { icon = codicons.get("symbol-event"), hl = "@type" },
				Operator = { icon = codicons.get("symbol-operator"), hl = "@operator" },
				TypeParameter = { icon = codicons.get("symbol-parameter"), hl = "@parameter" },
				Component = { icon = codicons.get("surround-with"), hl = "@function" }, -- no direct
				Fragment = { icon = codicons.get("code"), hl = "@constant" }, -- no direct
			},
		}
	end,
	config = function(_, opts)
		require("symbols-outline").setup(opts)
	end,
}
