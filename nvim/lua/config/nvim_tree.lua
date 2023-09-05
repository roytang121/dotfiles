require('nvim-tree').setup {
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
}

local api = require 'nvim-tree.api'
vim.keymap.set('n', '<leader>nn', api.tree.toggle, {})
