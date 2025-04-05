return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			plugins = {
				auto = true,
			},
			style = "night",
			styles={
				keywords = {italic = true},
				comments = {italic = true},
				sidebars = "transparent",
			},
			on_colors = function(colors)
				colors.comment = "#22ffb2"
			end
		},
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
