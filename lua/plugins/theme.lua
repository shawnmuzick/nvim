return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	'kyazdani42/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',--status line
	'akinsho/bufferline.nvim', --vscode like tabs
	'hiphish/rainbow-delimiters.nvim',
	--this breaks in the gitsigns file
	--no obvious or good reason, so moved it here
	--magically works fine
	'tpope/vim-fugitive',
}
