require("tokyonight").setup({
	transparent = true,
	styles={
		keywords = {italic = true},
		comments = {italic = true},
		sidebars = "transparent",
	},
	on_colors = function(colors)
		colors.comment = "#22ffb2"
	end
})

vim.cmd 'colorscheme tokyonight-night'
