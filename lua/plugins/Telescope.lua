return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('telescope').setup()
		vim.keymap.set("n","<leader>fgh","<cmd>lua require('telescope.builtin').git_commits()<cr>")
		vim.keymap.set("n","<leader>flm","<cmd>lua require('telescope.builtin').marks()<cr>")
		vim.keymap.set("n","<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
		vim.keymap.set("n","<leader>fb","<cmd>lua require('telescope.builtin').buffers()<cr>")
		vim.keymap.set("n","<leader>fh","<cmd>lua require('telescope.builtin').help_tags()<cr>")
		vim.keymap.set("n","<leader>fd","<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
		vim.keymap.set("n","<leader>fe","<cmd>lua require('telescope.builtin').diagnostics()<cr>")
		vim.keymap.set("n","<leader>fn","<cmd>lua require('telescope').extensions.notify.notify()<cr>")
	end
}
