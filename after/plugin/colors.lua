--vim.opt.background = 'dark'
ORANGE = "#eebe71"
BLUE = "#8addfb"
GREEN = "#21ffb0"
LIME = "#c3ea95"
WHITE = "#ffeeee"
GREY = "#191919"

local colors = require 'material.colors'
-- Theme style
vim.g.material_style = 'darker'

-- Colorscheme settings
require('material').setup({
	contrast = {
		sidebars = true,
		floating_windows = false,
		cursor_line = true,
		popup_menu = false,
		non_current_windows = true, -- Enable darker background for non-current windows
		filetypes = {
			"qf",
			"packer",
			"dapui_breakpoints",
		}
	},
	plugins = {
		"dap",
		"gitsigns",
		"indent-blankline",
		"neogit",
		"nvim-cmp",
		"nvim-tree",
		"nvim-web-devicons",
		"telescope",
		"which-key",
	},
	styles = {
		comments = { italic = true },
		functions = { italic = true },
	},
	disable = {
		borders = true,
		background = true,
		term_colors = false,
		eob_lines = false
	},
	lualine_style = 'stealth',
	custom_colors = function(colors)
		colors.main.yellow = BLUE
		colors.main.red = BLUE
		colors.main.purple = BLUE
		colors.main.darkpurple = BLUE
		colors.main.pink = BLUE
		colors.syntax.type = ORANGE
		colors.syntax.comments = GREEN
		colors.syntax.string = LIME
		colors.syntax.variable = ORANGE
		colors.syntax.field = ORANGE
		colors.syntax.value = ORANGE
		colors.syntax.keyword = BLUE
		--colors.editor.bg = GREY
	end
})

-- Apply the colorscheme
--vim.cmd 'colorscheme material'

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

