local lsp = require("lsp-zero")
lsp.set_preferences({
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

vim.diagnostic.config({
	Lua={diagnostics = {globals={'vim'}}},
	virtual_text = false
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'tsserver',
		'eslint',
		'rust_analyzer',
		'biome',
		'lua_ls',
		'clangd',
		'csharp_ls',
		'marksman',
	},
	handlers = {
		lsp.default_setup,
	},
	handlers = nil
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig',{}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		--vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		local opts = {buffer = ev.buf}
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		--vim.keymap.set("n", "", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	end
})

lsp.setup()
