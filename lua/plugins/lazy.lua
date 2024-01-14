local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins ={
	--Git
	'lewis6991/gitsigns.nvim',
	'tpope/vim-fugitive',

	--lsp autocomplete stuff
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'rafamadriz/friendly-snippets',
	{

		'L3MON4D3/LuaSnip',
		build = "make install_jsregexp"
	},
	'saadparwaiz1/cmp_luasnip',

	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	},

	-- fuzzy find
	"nvim-lua/plenary.nvim",
	'nvim-telescope/telescope.nvim',

	-- UI and Theme
	'rcarriga/nvim-notify',
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{--lsp notifications
		"j-hui/fidget.nvim",
		opts = {
		},
	},
	'folke/trouble.nvim', 	--error window
	'kyazdani42/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',--status line
	'akinsho/bufferline.nvim', --vscode like tabs
	'kyazdani42/nvim-tree.lua',
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, --indent guides
	'hiphish/rainbow-delimiters.nvim',
}
require("lazy").setup(plugins)
