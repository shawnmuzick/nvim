return {
	{'nvim-tree/nvim-web-devicons'},
--	{'akinsho/bufferline.nvim'}, --vscode like tabs
	{'hiphish/rainbow-delimiters.nvim'},
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
		config = function()
			vim.cmd 'colorscheme tokyonight-night'
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			--fake custom theme to set transparent statusline background
			local theme = require("lualine.themes.tokyonight")
			theme.normal.c.bg = nil
			require('lualine').setup({
				options = {
					theme = theme,
					section_separators = { left = '', right = '' },
					component_separators = { left = '', right = '' }
				},
				extensions = {'quickfix', 'mason','lazy','fugitive'}
			})
		end
	}
}
