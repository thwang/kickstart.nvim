-- Editor enhancements
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Enable repeating supported plugin maps with "."
  'tpope/vim-repeat',

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
}
