return {
	'nvim-lualine/lualine.nvim',--status line
	config = function()
		require('lualine').setup({
			options = {
				section_separators = { left = '', right = '' },
				component_separators = { left = '', right = '' }
			},
			theme='tokyonight'
		})
	end
}
