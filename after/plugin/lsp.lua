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
		["lua_ls"] = function ()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						--define vim as a global
						diagnostics = {globals = {"vim"}}
					}
				}
			})
		end
	},
})

local group = vim.api.nvim_create_augroup('UserLspConfig',{})
--[[
vim.api.nvim_create_autocmd('User',{
	group = group,
	pattern = {'LspProgressUpdate'},
	callback = function()
		for _, client in ipairs() do
			local name = client.name or ""
			local msg = client.message or ""
			local prog = client.percentage or 0
			local title = lsp.title or ""

			vim.notify(string.format(" %%<%s: %s %s (%s%%%%) ", name, title, msg, prog))
		end
		vim.notify(vim.lsp.util.get_progress_messages())
	end
})
]]--

vim.api.nvim_create_autocmd('LspAttach', {
	group = group,
	callback = function(ev)
		local names = ""
		for _, client in ipairs(vim.lsp.get_active_clients()) do
			names = names .. client.name
		end

		local opts = {buffer = ev.buf}
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		--vim.keymap.set("n", "", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
		vim.notify("Finished setting up lsps: " ..  names)
	end
})

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

lsp.setup()
