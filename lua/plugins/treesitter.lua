return {
	'nvim-treesitter/nvim-treesitter',
	config = function ()
		require('nvim-treesitter.configs').setup({
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			}
		})
	end,
	build = function()
		require("nvim-treesitter.install").update({with_sync = true})()
	end
}
