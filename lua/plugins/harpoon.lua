-- Harpoon for quick file navigation
return {
  {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }

      local function set_navigation(number)
        vim.keymap.set('n', '<leader>' .. number, function()
          harpoon:list():select(number)
        end, { desc = 'Go to harpoon file ' .. number })
      end

      set_navigation(1)
      set_navigation(2)
      set_navigation(3)
      set_navigation(4)
      set_navigation(5)
      set_navigation(6)
      set_navigation(7)
      set_navigation(8)
      set_navigation(9)
    end,
    keys = {
      {
        '<leader>ha',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'harpoon file',
      },
      {
        '<leader>hl',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'harpoon quick menu',
      },
    },
  },
}
