return {
	--lsp autocomplete stuff
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'rafamadriz/friendly-snippets',
	{

		'L3MON4D3/LuaSnip',
		build = "make install_jsregexp"
	},
	'saadparwaiz1/cmp_luasnip',
	--'jmederosalvarado/roslyn.nvim',
	config = function()
	end
}
