return {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
    init = function()
      require("core.utils").load_mappings({
        n = {
        ["<leader>wK"] = {
          function ()
            vim.cmd("WhichKey")
          end,
          "Which-key all keymaps"
        },
        ["<leader>wk"] = {
          function ()
            local input = vim.fn.input("WhichKey: ")
            vim.cmd("WhichKey " .. input)
          end,
          "Which-key query lookup"
        }
      }
      })
    end,
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
}

