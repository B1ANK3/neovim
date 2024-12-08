return {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm' },
  version = '*',
  init = function()
        vim.keymap.set('n', '<A-v>', '<cmd>ToggleTerm direction=vertical name=vertical<CR>')
        vim.keymap.set('n', '<A-h>', '<cmd>ToggleTerm direction=horizontal name=horizontal<CR>')
        vim.keymap.set('n', '<A-f>', '<cmd>ToggleTerm direction=float name=float<CR>')

        vim.keymap.set('t', '<A-v>', '<cmd>ToggleTerm toggle name=vertical<CR>')
        vim.keymap.set('t', '<A-h>', '<cmd>ToggleTerm toggle name=horizontal<CR>')
        vim.keymap.set('t', '<A-f>', '<cmd>ToggleTerm toggle name=float<CR>')
  end,
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return 20
      elseif term.direction == 'vertical' then
        vim.notify('Terminal size: '..vim.fn.winwidth(0), vim.log.levels.INFO)
        return vim.fn.winwidth(0)
      end
    end,
    hide_numbers = true,
    persist_size = false,
  },
}
