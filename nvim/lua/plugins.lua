return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'vscode',
                    section_separators = {},
                    component_separators = {},
                    globalstatus = true,
                },
                sections = {
                    lualine_c = {
                        {
                            'filename',
                            file_status = true, -- displays file status (readonly status, modified status)
                            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                        },
                    },
                },
            }
        end,
    },
    {
        'tpope/vim-sleuth',
        event = 'BufRead',
    }, -- Detect tabstop and shiftwidth automatically
    {
        'tpope/vim-unimpaired',
        event = 'VeryLazy',
    },
    {
        'tpope/vim-surround',
        event = 'BufRead',
    },
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    -- {
    --     'kevinhwang91/nvim-ufo',
    --     enabled = true,
    --     dependencies = { 'kevinhwang91/promise-async' },
    --     config = function()
    --         require 'config.ufo'
    --     end,
    -- },
    {
        'ibhagwan/fzf-lua',
        -- event = 'VimEnter',
        config = function()
            -- calling `setup` is optional for customization
            -- require("fzf-lua").setup({ "max-perf" })
            require 'config.fzf-lua'
        end,
    },
    {
        'alexghergh/nvim-tmux-navigation',
        event = 'VeryLazy',
        config = function()
            require 'config.tmux_navigation'
        end,
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- event = 'VeryLazy',
        main = 'ibl',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        opts = {
            -- char = '┊',
            -- show_trailing_blankline_indent = false,
            -- show_current_context = true,
            -- show_current_context_start = true,
        },
    },
    -- colorschemes
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        event = 'VeryLazy',
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                integrations = {
                    cmp = {
                        enabled = true,
                        border = {
                            completion = true,
                            documentation = true,
                        },
                    },
                    nvimtree = false,
                    treesitter = true,
                },
                floating_border = 'on',
                transparent_background = true,
                -- dim_inactive = {
                -- 	enabled = true,
                -- },
            }
        end,
    },
    {
        'Mofiqul/vscode.nvim',
        opts = {
            -- Alternatively set style in setup
            -- style = 'light'

            -- Enable transparent background
            transparent = false,

            -- Enable italic comment
            italic_comments = true,

            -- Underline `@markup.link.*` variants
            underline_links = true,

            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,

            -- Apply theme colors to terminal
            terminal_colors = true,

            -- Override colors (see ./lua/vscode/colors.lua)
            -- color_overrides = {
            --     vscLineNumber = '#FFFFFF',
            -- },

            -- Override highlight groups (see ./lua/vscode/theme.lua)
            group_overrides = {
                -- this supports the same val table as vim.api.nvim_set_hl
                -- use colors from this colorscheme by requiring vscode.colors!
                -- Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
            },
        },
    },
    {
        'stevearc/oil.nvim',
        -- event = 'VeryLazy',
        -- Optional dependencies
        -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        config = function()
            require 'config.oil'
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        enabled = true,
        dependencies = {
            -- 'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require 'config.treesitter'
        end,
    },
    { 'j-hui/fidget.nvim', opts = {} },
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        -- dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        config = function()
            require 'config.blink'
        end,

        opts_extend = { 'sources.default' },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false,
        ft = { 'rust' },
        config = function()
            require 'config.rustaceanvim'
        end,
    },
    { -- Autoformat
        'stevearc/conform.nvim',
        lazy = false,
        enabled = true,
        keys = {
            {
                '<leader>ff',
                function()
                    require('conform').format { async = true, lsp_fallback = false }
                end,
                mode = '',
                desc = '[F]ormat buffer',
            },
        },
        opts = {
            notify_on_error = true,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true, python = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                rust = { 'rustfmt' },
                markdown = { 'prettier' },
                -- Conform can also run multiple formatters sequentially
                -- python = { 'ruff_format' },
                --
                -- You can use a sub-list to tell conform to run *until* a formatter
                -- is found.
                -- javascript = { { "prettierd", "prettier" } },
            },
        },
    },
    -- gits
    {
        'tpope/vim-fugitive',
        event = 'VeryLazy',
    },
    -- {
    --     'tpope/vim-rhubarb',
    --     event = 'VeryLazy',
    -- },
    {
        'airblade/vim-gitgutter',
        config = function()
            vim.keymap.set('x', '<leader>gl', function()
                local start_line = vim.fn.line "'<"
                local end_line = vim.fn.line "'>"
                local file = vim.fn.expand '%:p'
                local cmd = string.format(':G log -p -L %d,%d:%s', start_line, end_line, file)
                vim.cmd(cmd)
            end, { desc = 'Git log for selected lines' })
        end,
    },
    {
        'sindrets/diffview.nvim',
        event = 'VeryLazy',
        opts = {
            use_icons = false,
        },
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            signs = false,
        },
    },
}
