local opt = vim.opt

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
opt.number = true
opt.numberwidth = 2
opt.ruler = false
-- opt.relativenumber = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Colorscheme in terminals
opt.termguicolors = true

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Keep an undo file
opt.undofile = true

-- Enable mouse mode
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false
opt.laststatus = 3

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
opt.breakindent = true

-- indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.softtabstop = 4

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.fillchars = { eob = ' ' }
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Ignores file prompts
opt.shortmess:append 'sI'

-- Cursor wrapping
opt.whichwrap:append '<>[]hl'

-- Disable omnifunc
opt.omnifunc = nil

-- Session buffers to save
opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- disable default providers
for _, provider in ipairs { 'node', 'perl', 'python3', 'ruby' } do
  vim.g['loaded_' .. provider .. '_provider'] = 0
end
