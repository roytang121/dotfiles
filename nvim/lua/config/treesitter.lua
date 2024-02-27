require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<cr>',
            node_incremental = '<tab>',
            scope_incremental = '<cr>',
            scope_decremental = '<s-cr>',
            node_decremental = '<s-tab>',
        },
    },
    refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = 'grr' } },
        highlight_definitions = { enable = true },
    },
    matchup = { enable = true, include_match_words = true, enable_quotes = true },
    autotag = { enable = true },
}
-- enable folding
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
 -- vim.wo.foldlevel = 99

