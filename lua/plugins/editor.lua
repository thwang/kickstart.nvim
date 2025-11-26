-- Editor enhancements
return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {}
    end,
  },
}
