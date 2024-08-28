require('which-key').setup {
    win = {
        border = 'single',
        position = 'bottom',
        padding = { 0, 0, 0, 0 },
        margin = { 0, 0, 0, 0 },
    },
}

-- Document existing key chains with the new format
require('which-key').add {
    { '<leader>c', group = '[C]ode' },
    { '<leader>c_', hidden = true },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>d_', hidden = true },
    { '<leader>r', group = '[R]ename' },
    { '<leader>r_', hidden = true },
    { '<leader>s', group = '[S]earch' },
    { '<leader>s_', hidden = true },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>w_', hidden = true },
}
