-- Git plugins
return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gbl', function()
        if vim.bo.filetype == 'fugitiveblame' then
          vim.cmd 'q'
        else
          vim.cmd.Git 'blame'
        end
      end, { silent = true, desc = '[g]it [bl]ame' })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
