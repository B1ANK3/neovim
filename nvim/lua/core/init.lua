local opt = vim.opt
local g = vim.g

--- options ---
opt.laststatus = 3
opt.showmode = false

-- change the cursor color: https://neovim.io/doc/user/faq.html#faq
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- indenting
opt.expandtab = false
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk
opt.updatetime = 250

-- cursor wrapping
opt.whichwrap:append("<>[]hl")

-- make leader <space>
g.mapleader = " "

-- disable defaults
for _, provider in ipairs({"node", "perl", "python3", "ruby"}) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

--- autocmds ---
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = "qf",
  callback = function ()
    vim.opt_local.buflisted = false
  end
})

-- Autoreload
autocmd("BufWritePost", {
  pattern = vim.tbl_map(function (path)
    return vim.fs.normalize(vim.loop.fs_realpath(path))
  end, vim.fn.glob(vim.fn.stdpath("config").."/**/*.lua", true, true, true)),
  group = vim.api.nvim_create_augroup("ReloadConfig", {}),
  callback = function ()
    vim.notify("Restart NeoVim for changes to take effect", 2)
  end
})
