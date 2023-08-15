return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("config.mini")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		init = function()
			require("config.telescope_setup")
		end,
		config = function()
			require("config.telescope")
		end,
		cmd = "Telescope",
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("config.tmux_navigation")
		end,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				dim_inactive = {
					enabled = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		config = function()
			require("config.treesitter")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("config.mason")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("config.lspconfig")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("config.formatter")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("config.nvim_tree")
		end,
	},
}
