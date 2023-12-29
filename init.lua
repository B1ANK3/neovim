require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- bootstrap nvim
if not vim.loop.fs_stat(lazypath) then
	require("core.bootstrap").lazy(lazypath)
end
vim.opt.rtp:prepend(lazypath)

local config = require("core.utils").load_config()

-- local vim_conf_dir = vim.fn.stdpath("config") .. "/vim"
-- local vim_files = vim.fn.readdir(vim_conf_dir, [[v:val =~ '\.vim$']])
-- for _, name in pairs(vim_files) do
-- local path = string.format("%s/%s", vim_conf_dir, name)
-- local source = "source " .. path
-- vim.cmd(source)
-- end

-- setup plugins
require("lazy").setup(config.plugins, config.lazy_config)

---
-- Profiling
local should_profile = os.getenv("NVIM_PROFILE")
if should_profile then
	require("profile").instrument_autocmds()
	if should_profile:lower():match("^start") then
		require("profile").start("*")
	else
		require("profile").instrument("*")
	end
end

local function toggle_profile()
	local prof = require("profile")
	if prof.is_recording() then
		prof.stop()
		vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" }, function(filename)
			if filename then
				prof.export(filename)
				vim.notify(string.format("Wrote %s", filename))
			end
		end)
	else
		prof.start("*")
	end
end
vim.keymap.set("", "<f2>", toggle_profile)
----
