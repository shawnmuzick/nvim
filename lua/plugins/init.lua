--settings
require('plugins.settings')
require('plugins.global_remaps')

--Plugins
require('plugins.lazy')
require('plugins.treesitter')
require("plugins.NvimTree")
require('plugins.Telescope')
require('plugins.Trouble')
require("bufferline").setup()
require('lualine').setup()
-- Lua
require('lualine').setup {
	options = {
		-- ... your lualine config
		theme = 'tokyonight'
		-- ... your lualine config
	}
}
require("tokyonight").setup({
	transparent = true,
	styles={
		keywords = {italic = true},
		comments = {italic = true},
	}
})


