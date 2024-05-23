-- Keybindings
local silent = { silent = true, noremap = true }

-- Window movement
-- vim.keymap.set('n', '<c-h>', '<c-w>h', silent)
-- vim.keymap.set('n', '<c-j>', '<c-w>j', silent)
-- vim.keymap.set('n', '<c-k>', '<c-w>k', silent)
-- vim.keymap.set('n', '<c-l>', '<c-w>l', silent)

vim.keymap.set('n', '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', { silent = true })
vim.keymap.set('n', '<C-\\>', '<Cmd>NvimTmuxNavigateLastActive<CR>', { silent = true })
vim.keymap.set('n', '<C-Space>', '<Cmd>NvimTmuxNavigateNavigateNext<CR>', { silent = true })
vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#<cr>', { desc = 'Close all buffers but the current one' }) -- https://stackoverflow.com/a/42071865/516188
