return {
    {
        'tpope/vim-sleuth',
        event = 'BufRead',
    }, -- Detect tabstop and shiftwidth automatically
    {
        'echasnovski/mini.nvim',
        event = 'VeryLazy',
        config = function()
            require 'config.mini'
        end,
    },
    --    {
    --        "folke/snacks.nvim",
    --        priority = 1000,
    --        lazy = false,
    --        ---@type snacks.Config
    --        opts = {
    --            bigfile = { enabled = true },
    --            dashboard = { enabled = true },
    --            explorer = { enabled = true },
    --            indent = { enabled = true },
    --            input = { enabled = true },
    --            notifier = {
    --                enabled = true,
    --                timeout = 3000,
    --            },
    --            picker = { enabled = true },
    --            quickfile = { enabled = true },
    --            scope = { enabled = true },
    --            scroll = { enabled = true },
    --            statuscolumn = { enabled = true },
    --            words = { enabled = true },
    --            styles = {
    --                notification = {
    --                    -- wo = { wrap = true } -- Wrap notifications
    --                }
    --            }
    --        }
    --    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        'kevinhwang91/nvim-ufo',
        enabled = true,
        dependencies = { 'kevinhwang91/promise-async' },
        config = function()
            require 'config.ufo'
        end,
    },
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
                    mini = true,
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
        'navarasu/onedark.nvim',
        event = 'VeryLazy',
        opts = {
            style = 'darker',
            transparent = true,
        },
    },
    {
        'folke/tokyonight.nvim',
        event = 'VeryLazy',
        opts = {
            transparent = false,
        },
    },
    {
        'rebelot/kanagawa.nvim',
        opts = {
            transparent = false,
            colors = { -- add/modify theme and palette colors
                palette = {
                    waveBlue1 = '#2D4F67',
                },
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
        },
    },
    { "rose-pine/neovim",     name = "rose-pine" },
    {
        'metalelf0/jellybeans-nvim',
        event = 'VeryLazy',
        dependencies = { 'rktjmp/lush.nvim' },
    },
    {
        'stevearc/oil.nvim',
        -- event = 'VeryLazy',
        -- Optional dependencies
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
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
    { 'stevearc/profile.nvim' },
    { 'j-hui/fidget.nvim',    opts = {} },
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        config = function()
            require 'config.blink'
        end,

        opts_extend = { "sources.default" }
    },
    {
        'nvim-neotest/neotest',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-neotest/nvim-nio',
            'antoinemadec/FixCursorHold.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require 'config.neotest'
        end,
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
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
                markdown = { 'mdformat' },
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
    {
        'tpope/vim-rhubarb',
        event = 'VeryLazy',
    },
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            require 'config.gitsigns'
        end,
    },
    {
        'sindrets/diffview.nvim',
        event = 'VeryLazy',
        opts = {},
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
