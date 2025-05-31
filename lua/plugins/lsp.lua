return {
	--lsp autocomplete stuff
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'rafamadriz/friendly-snippets',
	'saadparwaiz1/cmp_luasnip',
	{
		'L3MON4D3/LuaSnip',
		build = "make install_jsregexp"
	},
	{
		'mason-org/mason.nvim',
		config = function()
			require('mason').setup()
		end
	},
	{
		'mason-org/mason-lspconfig.nvim',
		dependencies = { 'neovim/nvim-lspconfig', 'mason-org/mason.nvim' },
		config = function()
			require('mason-lspconfig').setup({
				--    automatic_enable = false
				ensure_installed = {
					'ts_ls',
					'eslint',
					'rust_analyzer',
					'biome',
					'lua_ls',
					'clangd',
					'csharp_ls',
					'marksman',
					'html'
				},
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			--define vim as a global
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {diagnostics = {globals = {"vim"}}}
				}
			})
			--support cshtml files
			require("lspconfig").csharp_ls.setup({
				filetypes = {'cs','cshtml'},
			})
			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					vim.notify("Begin setting up lsps: ")
					local opts = {buffer = event.buf}
					local names = ""
					for _, cl in ipairs(vim.lsp.get_clients()) do
						names = names .. cl.name
					end
					vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
					vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
					vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
					vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
					--vim.keymap.set("n", "", function() vim.lsp.buf.signature_help() end, opts)
					vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
					vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
					vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
					vim.notify("Finished setting up lsps: " ..  names)
				end,
			})

			vim.diagnostic.config({virtual_text = false})

			local cmp = require('cmp')
			local cmp_select = {behavior = cmp.SelectBehavior.Select}

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
					['<Tab>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
					['<C-Space>'] = cmp.mapping.complete(),
				}),
				sources = cmp.config.sources(
					{
						{ name = 'nvim_lsp' },
						{ name = 'luasnip' },
					},
					{
						{ name = 'buffer' },
					}
				)
			})
		end
	}
	--'jmederosalvarado/roslyn.nvim',
}
