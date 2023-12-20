return {
  "echasnovski/mini.pairs",
  version = '*',
  keys = {"(", ")", "{", "}", "[", "]", '"', "'", "`"},
  config = function ()
    require("mini.pairs").setup()
  end
}
