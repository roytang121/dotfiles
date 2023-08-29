return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require 'config.mini'
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        init = function()
            require 'config.telescope_setup'
        end,
        config = function()
            require 'config.telescope'
        end,
        cmd = 'Telescope',
    },
    {
        'alexghergh/nvim-tmux-navigation',
        config = function()
            require 'config.tmux_navigation'
        end,
    },
    -- Set lualine as statusline
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enabled = false,
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
            show_current_context = true,
            show_current_context_start = true,
        },
    },
    -- colorschemes
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                integrations = {
                    cmp = true,
                    nvimtree = true,
                    treesitter = true,
                    mini = true,
                },
                transparent_background = true,
                -- dim_inactive = {
                -- 	enabled = true,
                -- },
            }
        end,
    },
    {
        'navarasu/onedark.nvim',
        opts = {
            style = 'dark',
            transparent = true,
        },
    },
    {
        'folke/tokyonight.nvim',
        opts = {
            transparent = true,
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'BufReadPost',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require 'config.treesitter'
        end,
    },
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
            -- This module contains a number of default definitions
            local rainbow_delimiters = require 'rainbow-delimiters'

            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
            }
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            {
                'williamboman/mason.nvim',
                config = function()
                    require 'config.mason'
                end,
            },
        },
        opts = {},
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
        config = function()
            require 'config.lspconfig'
        end,
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'williamboman/mason.nvim',
            'jay-babu/mason-nvim-dap.nvim',
            -- own debuggers
            'mfussenegger/nvim-dap-python',
        },
        config = function()
            require 'config.nvim-dap'
        end,
    },
    {
        'mhartington/formatter.nvim',
        config = function()
            require 'config.formatter'
        end,
    },
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require 'config.nvim_tree'
        end,
    },
    {
        'tenfyzhong/autoflake.vim',
    },
    -- gits
    {
        'tpope/vim-fugitive',
    },
    {
        'tpope/vim-rhubarb',
    },
    {
        'sindrets/diffview.nvim',
        opts = {},
    },
    {
        'stevearc/overseer.nvim',
        dependencies = {
            {
                'stevearc/dressing.nvim',
                opts = {},
            },
        },
        config = function()
            require 'config.overseer'
        end
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
}
