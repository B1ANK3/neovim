return {
  "romgrk/barbar.nvim",
  lazy = false,
  init = function ()

    vim.g.barbar_auto_setup = false

    -- keymaps
    require('core.utils').load_mappings({
      n = {

    -- moving around buffers
    ["<tab>"] = {"<cmd>BufferNext<CR>", "Goto next buffer"},
    ["<S-tab>"] = {"<cmd>BufferPrevious<CR>", "Goto previous buffer"},
    ["<leader>x"] = {"<cmd>BufferClose<CR>", "Close buffer"}
      }
    }, {
        noremap = true,
        silent = true
      })
  end,
  config = function ()
    require("barbar").setup({
      animation = true,
      autohide = false,
      tabpages = true,
      clickable = true,
      focus_on_close = "right",
      hide = {
        extensions = false,
        inactive = false,
      },
      highlight_visable = true,

      icons = {
        gitsigns = {
          added = {enabled = true, icon = "+"},
          changed = {enabled = true, icon = "~"},
          deleted = {enabled = true, icon = "-"}
        },
        filetype = {
          enabled = true
        },
        separator = {left = "▎", right = ""},
        separator_at_end = true,

        modified = {button = "●"},
        preset = "default",
      },

      -- insert_at_end = true,
      -- insert_at_start = false,

      maximum_padding = 1,
      minimum_padding = 1,
      maximum_length = 30,
      minimum_length = 0,

      sidebar_filetypes = {
        -- Nvimtree = true
      }

    })
  end
}
