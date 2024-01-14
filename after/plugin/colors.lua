require("tokyonight").setup({
	--transparent = true,
	styles={
		keywords = {italic = true},
		comments = {italic = true},
		sidebars = "transparent",
	},
	on_colors = function(colors)
		colors.comment = "#22ffb2"
	end
})
--fake custom theme to set transparent statusline background
local theme = require("lualine.themes.tokyonight")
theme.normal.c.bg = nil
-- Lua
require('lualine').setup({
	options = {
		-- ... your lualine config
		theme = theme
	},
	extensions = {'quickfix', 'mason','lazy','fugitive'}
})
vim.cmd 'colorscheme tokyonight-night'
