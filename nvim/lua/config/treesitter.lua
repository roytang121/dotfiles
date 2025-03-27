require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = { 'log', 'yml', 'yaml', 'json' },
    },
    indent = { enable = false },
    refactor = {
        smart_rename = { enable = false, keymaps = { smart_rename = 'grr' } },
        highlight_definitions = { enable = false },
    },
    matchup = { enable = false, include_match_words = true, enable_quotes = true },
    autotag = { enable = false },
}
