return {
    {
        'folke/neodev.nvim',
        event = 'VeryLazy',
        opts = {},
    },
    {
        'tpope/vim-sleuth',
        event = 'BufRead',
    }, -- Detect tabstop and shiftwidth automatically
    {
        'numToStr/Comment.nvim',
        opts = {},
    },
    {
        'echasnovski/mini.nvim',
        event = 'VeryLazy',
        version = false,
        config = function()
            require 'config.mini'
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require 'config.autopairs'
        end,
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        config = function ()
            require 'config.noice'
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            -- "rcarriga/nvim-notify",
        }
    },
    {
        "ibhagwan/fzf-lua",
        -- event = 'VimEnter',
        -- optional for icon support
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            -- require("fzf-lua").setup({ "max-perf" })
            require("config.fzf-lua")
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        enabled = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            { -- If encountering errors, see telescope-fzf-native README for installation instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        config = function()
            require 'config.telescope_setup'
        end,
        cmd = 'Telescope',
    },
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        event = 'VeryLazy',
        config = function()
            require 'config.toggleterm'
        end,
    },
    {
        'alexghergh/nvim-tmux-navigation',
        event = 'VeryLazy',
        config = function()
            require 'config.tmux_navigation'
        end,
    },
    -- Set lualine as statusline
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        opts = {
            options = {
                icons_enabled = false,
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_c = {
                    {
                        'filename',
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
                    }
                }
            }
        },
    },
    {
        'akinsho/bufferline.nvim',
        enabled = false,
        event = 'VeryLazy',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {},
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        event = 'VeryLazy',
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
                    nvimtree = true,
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
            transparent = true,
            colors = { -- add/modify theme and palette colors
                palette = {
                    waveBlue1 = '#2D4F67',
                },
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
        },
    },
    {
        'metalelf0/jellybeans-nvim',
        event = 'VeryLazy',
        dependencies = { 'rktjmp/lush.nvim' },
    },
    {
        'stevearc/oil.nvim',
        -- event = 'VeryLazy',
        -- Optional dependencies
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'config.oil'
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufRead',
        build = ':TSUpdate',
        enabled = true,
        dependencies = {
            -- 'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            require 'config.treesitter'
        end,
    },
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
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            -- { 'j-hui/fidget.nvim', opts = {} },
            -- java
            --'mfussenegger/nvim-jdtls',
        },
        opts = {
            inlay_hints = { enabled = true },
        },
        config = function()
            require 'config.lspconfig'
        end,
    },
    {
        'mfussenegger/nvim-dap',
        event = 'VeryLazy',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',
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
        version = '^4', -- Recommended
        lazy = false,
        ft = { 'rust' },
        config = function()
            require 'config.rustaceanvim'
        end,
    },
    {
        'mhartington/formatter.nvim',
        event = 'VeryLazy',
        config = function()
            require 'config.formatter'
        end,
    },
    {
        'tenfyzhong/autoflake.vim',
        event = 'VeryLazy',
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
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
        enabled = false,
        opts = {},
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
        event = 'VeryLazy',
        config = function()
            require 'config.copilot'
        end,
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
