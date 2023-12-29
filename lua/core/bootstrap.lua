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

--- lazy.nvim ---
export.lazy = function (install_path)
  echo("Installing lazy.nvim & plugins ...")
  local lazy_repo = "https://github.com/folke/lazy.nvim.git"
  shell_call({"git", "clone", "--filter=blob:none", "--branch=stable", lazy_repo, install_path})
end

return export
