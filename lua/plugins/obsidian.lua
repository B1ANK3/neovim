-- Fidget notifier for epwalsh/pomo.nvim

local emotes = {
	"(＾▽＾)",
	"(¬‿¬)",
	"（＾ω＾）",
	"┬┴┬┴┤ω・)",
	"ಠ◡ಠ",
	"/ᐠ｡ꞈ｡ᐟ\\",
	"(=˃ᆺ˂=)",
	"（ꏿ ω ꏿ）",
	"(•ㅅ•)",
	"(╯°□°）╯︵ ┻━┻",
	"( ︶｡︶✽)",
	"︻デ┳═ー",
	"▭▭ι═════ﺤ ",
	"(⁰▿⁰)◜▬ι═══════ﺤ",
	"⊂((・▽・))⊃",
	"(⁄ ⁄>⁄ ▽ ⁄<⁄ ⁄) ",
	"(〃ﾉωﾉ)",
	"(¬_¬”)",
	">(///) <",
	"(ー_ーゞ",
	"ヾ(＾∇＾)"
}

local FidgetNotifier = {}

FidgetNotifier.new = function(timer, opts)
	local self = setmetatable({}, { __index = FidgetNotifier })
	self.timer = timer
	self.id = "pomofidgetnotify"
	self.opts = opts and opts or {}
	self.title_icon = self.opts.title_icon and self.opts.title_icon or "󱎫"
	self.text_icon = self.opts.text_icon and self.opts.text_icon or "󰄉"
	return self
end

FidgetNotifier.tick = function(self, time_left)
	self.handle.message = string.format(
		"%s %s %s",
		self.text_icon,
		require("pomo.util").format_time(time_left),
		self.timer.paused and "(paused)" or ""
	)
end

FidgetNotifier.start = function(self)
	self.handle = require("fidget.progress").handle.create({
		title = string.format("%s %s", self.title_icon, self.timer.name or ("Timer #" .. self.timer.id)),
		cancellable = true,
		message = string.format(" %s starting..", self.text_icon),
		done = false,
		lsp_client = {
			name = emotes[math.random(#emotes)] .. " pomo~",
		},
	})
end

FidgetNotifier.done = function(self)
	self.handle:finish()
	require("fidget").notify(string.format("%s timer done", self.text_icon), vim.log.levels.WARN, { ttl = 3 })
	if self.opts.done_callback then
		self.opts.done_callback()
	end
end

FidgetNotifier.stop = function(self)
	self.handle:cancel()
	require("fidget").notify(string.format("%s stopping..", self.text_icon), vim.log.levels.INFO, { ttl = 1 })
end

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	event = {
		-- TODO: Target any folder with .obsidian folder included
		"BufReadPre " .. vim.fn.expand("~") .. "/Sync/Thoth/*",
		"BufNewFile " .. vim.fn.expand("~") .. "/Sync/Thoth/*",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			-- Pomo timer doesn't catch attention with figdet notifications
			-- Pomo timer also can't do intervals
			"epwalsh/pomo.nvim",
			version = "*",
			cmd = { "TimerStart", "TimerStop", "PomoTimer", "TimerRepeat" },
			init = function()
				vim.api.nvim_create_user_command("PomoTimer", function()
					-- TODO: Create a loop that uses 2 timers in a loop
					-- 4 15m with 3 breaks inbetween with 10m break after all 4 timers
					vim.cmd("TimerRepeat 15m 4 Focuus")
				end, {})

				vim.api.nvim_create_user_command("TimerRemoveAll", function()
					vim.cmd("TimerStop -1")
				end, {})
			end,
			opts = {
				update_interval = 1000,
				notifiers = {
					{
						init = FidgetNotifier.new,
						opts = {},
					},
				},
			},
		},
	},
	opts = {
		workspaces = {
			{
				name = "Thoth",
				path = "~/Sync/Thoth",
			},
		},
	},
}
