return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function ()
    require("mason-lspconfig").setup({
      ensure_installed = {"lua_ls"},
      automatic_installation = true,
    })


    -- Automatic LSP installer and setup 
    -- check :h mason-lspconfig-automatic-server-setup
    require("mason-lspconfig").setup_handlers({
      -- default setup for installed lsps
      function (server_name)
        require("lspconfig")[server_name].setup({})
      end,
    })
  end
}
