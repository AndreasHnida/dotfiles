-- plugins/typescript-tools.lua
return {
	'pmizio/typescript-tools.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'neovim/nvim-lspconfig'
	},
	ft = { 'javascript', 'typescript', 'vue' },
	opts = {},
	config = function()
		require('typescript-tools').setup {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			filetypes = { 'javascript', 'typescript', 'vue', 'typescriptreact', 'javascriptreact' },
			settings = {
				tsserver_plugins = {
					'@vue/typescript-plugin', -- wichtig für Vue+Nuxt
				},
				jsx_close_tag = { enable = true, filetypes = { 'javascriptreact', 'typescriptreact' } },
			},
		}
	end,
}
