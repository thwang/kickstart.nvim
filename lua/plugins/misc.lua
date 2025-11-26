-- Miscellaneous plugins
return {
  -- Twilight for dimming inactive code
  {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {}
      vim.keymap.set('n', '<leader>ttw', function()
        require('twilight').toggle()
      end, { desc = '[T]oggle [T][w]ilight' })
    end,
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
