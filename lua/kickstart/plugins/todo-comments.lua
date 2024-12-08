-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      require('kickstart.utils').lazy_load_on_bufent 'todo-comments.nvim'
    end,
    opts = { signs = false },
  },
}
-- vim: ts=2 sts=2 sw=2 et
