-- Keymaps configuration
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode with double Esc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Split navigation with CTRL+hjkl
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Save file
vim.keymap.set('n', '<leader>ww', ':w<cr>', { desc = 'save current files' })

-- Escape from insert mode
vim.keymap.set('i', '<C-e>', '<esc>', { desc = '[E]scape from insert mode' })

-- Toggle previous buffer
vim.keymap.set('n', '<leader><leader>', ':e#<cr>', { desc = 'toggle prev buffer' })

-- Yank file path to clipboard
vim.keymap.set('n', '<leader>yf', function()
  local filepath = vim.fn.expand '%:.' -- Relative path from project root
  if filepath == '' then
    filepath = vim.fn.expand '%:p' -- Fallback to full path if no relative path
    print 'Warning: Using full path instead'
  end
  vim.fn.setreg('+', filepath)
  vim.fn.setreg('"', filepath) -- Also set default register as backup
  print('Copied to clipboard: ' .. filepath)
  -- Verify it was set
  local clipboard_content = vim.fn.getreg '+'
  if clipboard_content ~= filepath then
    print 'ERROR: Clipboard content does not match!'
  end
end, { desc = '[Y]ank [F]ile path (from root) to Sys clipboard' })

-- Yank file path with line number to clipboard
vim.keymap.set('n', '<leader>yfn', function()
  local filepath = vim.fn.expand '%:.' .. ':' .. vim.fn.line '.' -- Relative path from project root with line number
  vim.fn.setreg('+', filepath)
  print('Copied to clipboard: ' .. filepath)
end, { desc = '[Y]ank [F]ile path w/ [n]umber to Sys clipboard' })

-- Insert date and time
vim.keymap.set('n', '<leader>dt', function()
  vim.cmd 'r! date'
end, { desc = 'Insert [d]ate and [t]ime from system' })
