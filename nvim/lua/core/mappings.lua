-- n, i, v, t - modes 

local mappings = {
  i = {
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
  },
  n = {
    ["<Esc>"] = {":noh <CR>", "Clear highlights"},
    ["<C-s>"] = {"<cmd> w <CR>", "Save file"},

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    -- VSCode bindings that i like 
    ["<A-K>"] = { ":lua vim.notify('Multi Cursors not implemented', 3) <CR>", "Add cursor above" },
    ["<A-J>"] = { ":lua vim.notify('Multi Cursors not implemented', 3) <CR>", "Add cursor below" },
    -- ["<A-<UP>>"] = {"", ""},
    -- ["<A-<DOWN>>"] = {"", ""},

    -- Comments
    ["<C-/>"] = { ":lua vim.notify('Commenting not implemented',3) <CR>", "Comment a line" },

    -- Quick visual mode 
    ["<A-H>"] = {"<ve>","Select next word"},
    ["<A-L>"] = {"<vb>","Select previous word"},
    -- [""] = {"", ""},
    -- [""] = {"", ""},

    -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
    -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
    -- empty mode is same as using <cmd> :map
    -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },

    ["<leader>b"] = {"<cmd> enew <CR>", "New buffer"},
    ["<leader>n"] = {"<cmd> set nu! <CR>", "Toggle line number"},
    ["<leader>rn"] = {"<cmd> set rnu! <CR>", "Toggle relative line number"},

  },

  v = {
    ["<C-u>"] = {":lua vim.notify('Undo not implemented', 3)", "Undo in visual mode"},
    ["<C-r>"] = {":lua vim.notify('Redo not implemented', 3)", "Redo in visial mode"},

    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
  },

  x = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
  }

}

return mappings
