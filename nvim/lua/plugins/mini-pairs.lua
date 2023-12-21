-- TODO: Replace. Currently a little glitchy when adding a pair 
-- instead of adding a pair to the right of the cursor, it types the pair 
-- and moves the cursor back one, making a jolt with the cursor
return {
  "echasnovski/mini.pairs",
  version = '*',
  init = function ()
    require("core.utils").lazy_load_on_bufent("mini.pairs")
  end,
  config = function ()
    require("mini.pairs").setup()
  end
}
