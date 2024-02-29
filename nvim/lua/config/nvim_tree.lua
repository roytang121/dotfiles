require('nvim-tree').setup {
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },
    update_focused_file = {
        enable = true,
    },
}

local api = require 'nvim-tree.api'
vim.keymap.set('n', '<C-n>', api.tree.toggle, {})
