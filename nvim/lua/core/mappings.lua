-- n, i, v, t - modes 

local mappings = {
  i = {},
  n = {
    ["<Esc>"] = {":noh <CR>", "Clear highlights"},
    ["<C-s>"] = {"<cmd> w <CR>", "Save file"},


  },
  v = {}

}

return mappings
