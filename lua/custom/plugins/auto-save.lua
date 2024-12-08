return {
  'pocco81/auto-save.nvim',
  cmd = { 'ASToggle' },
  init = function()
    require('kickstart.utils').lazy_load_on_bufent 'auto-save.nvim'
  end,
}
