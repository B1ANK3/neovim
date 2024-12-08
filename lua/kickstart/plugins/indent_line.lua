return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    init = function()
      require('kickstart.utils').lazy_load_on_bufent 'indent-blankline.nvim'
    end,
    opts = {
      enabled = true,
      indent = {
        char = '▏',
        smart_indent_cap = true,
      },
      scope = {
        show_start = false,
        show_exact_scope = false,
      },
      exclude = {
        filetypes = {
          'man',
          'checkhealth',
          'help',
          'terminal',
          'lazy',
          'lspinfo',
          'TelescopePrompt',
          'TelescopeResults',
          'mason',
        },
        buftypes = { 'terminal' },
      },
    },
    config = function(_, opts)
      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require('ibl').setup(opts)
    end,
  },
}
