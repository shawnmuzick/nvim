vim.opt.termguicolors = true
vim.g.airline_theme='onedark'
vim.g.material_style = "darker"
vim.opt.background = 'dark'
require('material').setup(
{
	contrast = {
		sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
	},
		-- Give comments style such as bold, italic, underline etc.
	    styles = { 
        comments = {  italic = true }
    },
}
)
vim.cmd 'colorscheme material'
