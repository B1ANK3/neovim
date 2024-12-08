return {
  'akinsho/bufferline.nvim',
  version = '*',
  -- event = 'VeryLazy',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'famiu/bufdelete.nvim',
  },
  init = function()
    -- Create keybinds
    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Goto next buffer' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Goto previous buffer' })
    vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close current buffer' })
  end,
  opts = {
    options = {
      mode = 'buffers',
      themable = true,

      indicator = {
        style = 'icon',
      },

      diagnostics = 'nvim_lsp',

      offset = {
        {
          filetype = 'neo-tree',
          seperator = true,
        },
        {
          filetype = 'Outline',
          text = 'Symbol Outline',
        },
      },

      color_icons = true,
      show_close_icon = true,
      show_duplicate_prefix = true,

      separator_style = 'thin',
    },
  },
}
