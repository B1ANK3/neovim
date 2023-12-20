-- table exports 
local export = {}

-- local reassign
local fn = vim.fn

local function echo(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end
export.echo = echo

local function shell_call(args)
  local output = fn.system(args)
  assert(vim.v.shell_error == 0, "External call failed with error code: " .. vim.v.shell_error .. "\n" .. output)
end

export.lazy = function (install_path)
  --- lazy.nvim ---
  echo("Installing lazy.nvim & plugins ...")
  local lazy_repo = "https://github.com/folke/lazy.nvim.git"
  shell_call({"git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, install_path})
end

export.base46 = function ()
  --- base46 nvchad highlighting ---
  local lazy_path = fn.stdpath("data" .. "/lazy/base46")

  echo("Compiling base46 theme ...")
  local base46_repo = "https://github.com/NvChad/base46"
  shell_call({"git", "clone", "--depth", "1", "-b", "v2.0", base46_repo, lazy_path})
  vim.opt.rtp:prepend(lazy_path)

  require("base46").compile()
end


return export
