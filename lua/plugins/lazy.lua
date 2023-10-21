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
	'wbthomason/packer.nvim',
	'hiphish/rainbow-delimiters.nvim',
	'folke/trouble.nvim',
	--lsp autocomplete stuff
	'VonHeikemen/lsp-zero.nvim',
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'L3MON4D3/LuaSnip'},
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'saadparwaiz1/cmp_luasnip',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',

	-- Snippets
	'L3MON4D3/LuaSnip',
	'rafamadriz/friendly-snippets',
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	},
	-- fuzzy find
	"nvim-lua/plenary.nvim",
	'nvim-telescope/telescope.nvim',
	-- Git
	'tpope/vim-fugitive',
	-- Theme
	'marko-cerovac/material.nvim',
	-- UI
	'kyazdani42/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	'akinsho/bufferline.nvim',
	'kyazdani42/nvim-tree.lua'
}
require("lazy").setup(plugins, opts)
