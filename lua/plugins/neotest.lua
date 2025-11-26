-- Neotest
return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      { 'fredrikaverpil/neotest-golang', version = '*' }, -- Installation
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-golang', -- Registration
        },
        require('neotest.logging'):set_level(vim.log.levels.DEBUG),
        -- this isnt currently working
        output = { enabled = true, open_on_run = true },
      }
    end,
    -- stylua: ignore
    keys = {
      {"<leader>t", "", desc = "+test"},
      { "<leader>tA", function() require("neotest").run.run(vim.uv.cd()) end, desc = "Run All Test Files" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>tn", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Neotest Summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Neotest Output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Neotest Output Panel" },
      { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop Neotestk" },
    { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Neotest Watch" },

    -- TODO ADD debugger
    -- require("neotest").run.run({strategy = "dap"})
    },
  },
}
