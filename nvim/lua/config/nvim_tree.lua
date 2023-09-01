require('nvim-tree').setup {
    filters = {
        dotfiles = false,
    },
}

local api = require 'nvim-tree.api'
vim.keymap.set('n', '<leader>nn', api.tree.toggle, {})
