-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal' },
  },
  opts = {

    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = false,
    auto_clean_after_session_restore = true,

    sort_case_sensitive = false,

    default_component_configs = {
      container = {
        enable_character_fade = true,
      },

      modified = {
        symbol = '[+]',
        highlight = 'NeoTreeModified',
      },

      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = 'NeoTreeFileName',
      },
    },

    filesystem = {
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_hidden = false,
        hide_dotfiles = false,
        hide_gitignore = false,
        hide_by_name = {
          'node_modules',
        },
        never_show = {
          '.DS_Store',
          'thumbs.db',
        },
      },
    },

    window = {
      position = 'right',
      mappings = {
        ['\\'] = 'close_window',
      },
    },

    buffers = {
      follow_current_file = {
        enabled = false,
        leave_dirs_open = false,
      },
    },
  },
}
