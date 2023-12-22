return {
	"gelguy/wilder.nvim",
	lazy = false,
	dependencies = { "roxma/nvim-yarp" },
	config = function()
		local wilder = require("wilder")

		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					fuzzy = 1,
					set_pcre2_pattern = 1,
				}),
				wilder.python_search_pipeline({
					pattern = "fuzzy",
				})
			),
		})

		wilder.set_option(
			"renderer",
			wilder.renderer_mux({
				pumblend = 20,
				[":"] = wilder.popupmenu_renderer({
					highlighter = wilder.basic_highlighter(),
				}),
				["/"] = wilder.wildmenu_renderer({
					highlighter = wilder.basic_highlighter(),
				}),
			})
		)

		wilder.setup({
			modes = { ":", "/", "?" },
		})
	end,
}
