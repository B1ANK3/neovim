return {
  "aznhe21/actions-preview.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  keys = {"<leader>ca"},
  init = function ()
   vim.api.nvim_create_autocmd({"LspAttach"}, {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function (ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        require("core.utils").load_mappings({
          n = {
            ["<leader>ca"] = { require('actions-preview').code_actions, "Lsp show code actions" }
          },

          v = {
            ["<leader>ca"] = { require('actions-preview').code_actions, "Lsp show code actions" }
          }
        }, opts)
      end
    })
  end,
  config = function ()
    require('actions-preview').setup({
      backend = {'telescope'},
    })
  end
}
