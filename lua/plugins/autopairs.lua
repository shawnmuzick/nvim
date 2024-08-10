return {
--[[
    'windwp/nvim-autopairs',
    event = "InsertEnter",
	config = function()
		require('nvim-autopairs').setup({
			map_cr = true,
			fast_wrap = {},
			check_ts = true
		})
	end
]]--
}
