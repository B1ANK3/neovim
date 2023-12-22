return {
	"lewis6991/gitsigns.nvim",
	ft = { "gitcommit", "diff" },
	init = function()
		vim.api.nvim_create_autocmd({ "BufRead" }, {
			group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
			callback = function()
				vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
				if vim.v.shell_error == 0 then
					vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
					vim.schedule(function()
						require("lazy").load({ plugins = "gitsigns.nvim" })
					end)
				end
			end,
		})
	end,
	opts = function()
		return {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "󰍵" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "│" },
			},
			on_attach = function(buf)
				require("core.utils").load_mappings({
					n = {
						["]c"] = {
							function()
								if vim.wo.diff then
									return "]c"
								end
								vim.schedule(function()
									require("gitsigns").next_hunk()
								end)
								return "<Ignore>"
							end,
							"Jump to next hunk",
							opts = { expr = true },
						},

						["[c"] = {
							function()
								if vim.wo.diff then
									return "[c"
								end
								vim.schedule(function()
									require("gitsigns").prev_hunk()
								end)
								return "<Ignore>"
							end,
							"Jump to prev hunk",
							opts = { expr = true },
						},

						-- Actions
						["<leader>rh"] = {
							function()
								require("gitsigns").reset_hunk()
							end,
							"Reset hunk",
						},

						["<leader>ph"] = {
							function()
								require("gitsigns").preview_hunk()
							end,
							"Preview hunk",
						},

						["<leader>gb"] = {
							function()
								package.loaded.gitsigns.blame_line()
							end,
							"Blame line",
						},

						["<leader>td"] = {
							function()
								require("gitsigns").toggle_deleted()
							end,
							"Toggle deleted",
						},
					},
				}, { buffer = buf })
			end,
		}
	end,
	config = function(_, opts)
		require("gitsigns").setup(opts)
	end,
}
