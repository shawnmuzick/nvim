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
			non_current_windows = true, -- Enable darker background for non-current windows
		},
		-- Give comments style such as bold, italic, underline etc.
		styles = {
			--comments = {  [[italic = true]] }
		},
		plugins={
			"nvim-tree",
			"nvim-web-devicons",
			"telescope"
		},
		disable={
	--		background = true,
		},
		lualine_style = "stealth",
		custom_highlights = {
			MyHighlightGroup = {
				--bg = '#212121'
			}
		}
	}
)

function colorize(color)
	color = color or "material"
	vim.cmd.colorscheme(color)
	--vim.api.nvim_set_hl(0, "Normal", {bg= "none"})
	--vim.api.nvim_set_hl(0, "NormalFloat", {bg= "none"})
end
colorize();
