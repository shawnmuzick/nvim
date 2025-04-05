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
