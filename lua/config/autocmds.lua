-- Autocommands configuration
-- See `:help lua-guide-autocommands`

-- Auto-reload files when they change on disk
local auto_reload_group = vim.api.nvim_create_augroup('auto-reload', { clear = true })

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  desc = 'Check for file changes',
  group = auto_reload_group,
  command = 'checktime',
})

vim.api.nvim_create_autocmd('FileChangedShellPost', {
  desc = 'Notify when file reloaded',
  group = auto_reload_group,
  callback = function()
    vim.notify('File reloaded because it changed on disk', vim.log.levels.INFO)
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
