return {
	'folke/trouble.nvim', 	--error window
	config = function ()
		vim.keymap.set("n","<leader>tr",":Trouble diagnostics<CR>")
		return require('trouble').setup()
	end
}
