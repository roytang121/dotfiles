local rt = require("rust-tools")
rt.setup({
    tools = { -- rust-tools options
        -- how to execute terminal commands
        -- options right now: termopen / quickfix / toggleterm / vimux
        executor = require('rust-tools.executors').toggleterm,
    },
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set('n', '<Leader>a', rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set('n', '<Leader>ca', rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
