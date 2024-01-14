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
		rquire("nvim-tresitter.install").update({with_sync = true})()
	end
}
