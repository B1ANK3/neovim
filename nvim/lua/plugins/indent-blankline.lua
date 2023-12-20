-- TODO: Find another more easily configurable plugin. This limits configs without some wierd tricks to get it to work well
-- eg: Removing the first indent is wack (using hooks and indirect config options)
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  init = function ()
    require('core.utils').lazy_load_on_bufent("indent-blankline.nvim")
  end,
  opts = {
    enabled = true,
    indent = {
      char ='▏',
      smart_indent_cap = true,
    },
    scope = {
      show_start = false,
      show_exact_scope = true,
    },
    exclude = {
      filetypes = {
        "man",
        "checkhealth",
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        ""
      },
      buftypes = {"terminal"}
    },
  },
  config = function (_, opts)
    -- TODO: Add rainbow colors
    -- https://github.com/lukas-reineke/indent-blankline.nvim#rainbow-delimitersnvim-integration

    -- only load keys when plugin is active
    require('core.utils').load_mappings({
      n = {
        ["<leader>cc"] = {
          function ()
            local ok, start = require("ibl.utils").get_current_context(
              vim.g.indent_blankline_context_patterns,
              vim.g.indent_blankline_use_treesitter_scope
            )

            if ok then
              vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), {start, 0})
              vim.cmd([[normal! _]])
            end
          end,
          "Jump to current context"
        }
      }
    })

    local hooks = require('ibl.hooks')

    hooks.register(
      hooks.type.WHITESPACE,
      hooks.builtin.hide_first_space_indent_level
    )

    require("ibl").setup(opts)
  end
}
