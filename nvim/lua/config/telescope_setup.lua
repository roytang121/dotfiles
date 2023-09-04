local builtin = require 'telescope.builtin'
require('telescope').load_extension 'file_browser'

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find_files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'live_grep' })
vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = 'buffers' })
vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols, { desc = 'workspace symbols' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'document symbols' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'references' })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = 'implementations' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'help tags' })
vim.keymap.set('n', '<leader>co', builtin.colorscheme, { desc = 'change colorscheme' })
vim.keymap.set('n', '<leader><space>', builtin.commands, { desc = 'commanads' })
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope file_browser<CR>', { noremap = true })
