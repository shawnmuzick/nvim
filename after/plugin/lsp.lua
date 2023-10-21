local lsp = require("lsp-zero")
lsp.set_preferences({
	suggest_lsp_servers = false,
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
	},
	handlers = {
		lsp.default_setup,
	},
})

--these attach on lsp
lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	--Diagnostics
	vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	--git history
	--vim.api.nvim_set_keymap('n', '<space>gh', '<cmd>Git whatchanged<CR><C-w>L',opts)
	--vim.api.nvim_set_keymap('n', '<space>gd', '<cmd>Git diff<CR><C-w>L',opts)
	--vim.keymap.set('n', '<space>le', '<cmd>lua vim.diagnostic.setqflist()<CR><C-w>L',opts)
	--vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	--vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()
