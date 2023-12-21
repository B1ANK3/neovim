return {
  "rshkarin/mason-nvim-lint",
  dependencies = {"williamboman/mason.nvim", "mfussenegger/nvim-lint"},
  config = function ()
    require("mason-nvim-lint").setup({
      ensure_installed = {"luacheck"},
      automatic_installation = true
    })
  end
}