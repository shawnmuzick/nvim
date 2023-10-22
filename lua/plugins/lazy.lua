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
plugins ={
	--Git
	'lewis6991/gitsigns.nvim',
	'tpope/vim-fugitive',

	--lsp autocomplete stuff
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'folke/trouble.nvim',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'saadparwaiz1/cmp_luasnip',
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	},

	-- fuzzy find
	"nvim-lua/plenary.nvim",
	'nvim-telescope/telescope.nvim',

	-- UI and Theme
	'marko-cerovac/material.nvim',
	'kyazdani42/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	'akinsho/bufferline.nvim',
	'kyazdani42/nvim-tree.lua',
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	'hiphish/rainbow-delimiters.nvim',
}
require("lazy").setup(plugins, opts)
