--settings
require('plugins.settings')
require('plugins.global_remaps')

--Plugins
require('plugins.lazy')
vim.notify = require("notify")
require('plugins.treesitter')
require("plugins.NvimTree")
require('plugins.Telescope')
require('plugins.Trouble')
require('plugins.gitsigns')
require("bufferline").setup({})
require("fidget").setup({})


--fake custom theme to set transparent statusline background
local theme = require("lualine.themes.tokyonight")
theme.normal.c.bg = nil
-- Lua
require('lualine').setup {
	options = {
		-- ... your lualine config
		theme = theme
	},
	extensions = {'quickfix', 'mason','lazy','fugitive'}
}
require("tokyonight").setup({
	transparent = true,
	styles={
		keywords = {italic = true},
		comments = {italic = true},
	}
})
