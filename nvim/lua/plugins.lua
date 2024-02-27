return {
    { 'folke/neodev.nvim', opts = {} },
    { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
    { 'numToStr/Comment.nvim', opts = {} },
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function ()
            require 'config.mini'
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
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
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function()
            require 'config.toggleterm'
        end,
    },
    {
        'EthanJWright/vs-tasks.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
        },
        config = function()
            require('vstask').setup {}
        end,
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
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {},
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
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
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                integrations = {
                    cmp = {
                        enabled = true,
                        border = {
                            completion = true,
                            documentation = true
                        }
                    },
                    nvimtree = true,
                    treesitter = true,
                    mini = true,
                },
                floating_border = "on",
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
            transparent = false,
        },
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        -- kinda broken for now
        enabled = true,
        dependencies = {
            -- 'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require 'config.treesitter'
        end,
    },
    -- {
    --     'andymass/vim-matchup',
    --     opts = {},
    -- },
    -- {
    --     'HiPhish/rainbow-delimiters.nvim',
    --     config = function()
    --         -- This module contains a number of default definitions
    --         local rainbow_delimiters = require 'rainbow-delimiters'
    --
    --         vim.g.rainbow_delimiters = {
    --             strategy = {
    --                 [''] = rainbow_delimiters.strategy['global'],
    --                 vim = rainbow_delimiters.strategy['local'],
    --             },
    --             query = {
    --                 [''] = 'rainbow-delimiters',
    --                 lua = 'rainbow-blocks',
    --             },
    --             highlight = {
    --                 'RainbowDelimiterRed',
    --                 'RainbowDelimiterYellow',
    --                 'RainbowDelimiterBlue',
    --                 'RainbowDelimiterOrange',
    --                 'RainbowDelimiterGreen',
    --                 'RainbowDelimiterViolet',
    --                 'RainbowDelimiterCyan',
    --             },
    --         }
    --     end,
    -- },
    -- {
    --     'williamboman/mason-lspconfig.nvim',
    --     dependencies = {
    --         {
    --             'williamboman/mason.nvim',
    --             config = function()
    --                 require 'config.mason'
    --             end,
    --         },
    --     },
    --     opts = {},
    -- },
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
            { 'j-hui/fidget.nvim', opts = {} },
            -- java
            'mfussenegger/nvim-jdtls',
        },
        config = function()
            require 'config.lspconfig'
        end,
    },
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            -- 'williamboman/mason.nvim',
            -- 'jay-babu/mason-nvim-dap.nvim',
            -- own debuggers
            'mfussenegger/nvim-dap-python',
        },
        config = function()
            require 'config.nvim-dap'
        end,
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function ()
            require 'config.neotest'
        end
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
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
        'lewis6991/gitsigns.nvim',
        config = function()
            require 'config.gitsigns'
        end,
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
        end,
    },
    { -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
        config = function() -- This is the function that runs, AFTER loading
            require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
    end,
  },
    {
        'github/copilot.vim',
        cnofig = function()
            require 'config.copilot'
        end,
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
}
