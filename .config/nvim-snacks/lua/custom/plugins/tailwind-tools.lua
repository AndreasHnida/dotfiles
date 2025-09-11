-- tailwind-tools.lua
return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
		"neovim/nvim-lspconfig",       -- optional
	},
	opts = {
		-- Tailwind Tools will automatically set up the tailwindcss language server
		-- The server configuration here will be passed to the LSP
		server = {
			override = false, -- Set to false to let tailwind-tools manage the server
			-- Force the server to recognize files even with v4
			filetypes = { "html", "css", "scss", "javascript", "typescript", "vue", "svelte", "astro", "javascriptreact", "typescriptreact" },
			init_options = {
				userLanguages = {
					vue = "html",
					scss = "css",
				},
			},
			settings = {
				tailwindCSS = {
					experimental = {
						classRegex = {
							-- Support for common patterns
							{ "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" },
							{ "(?:twMerge|twJoin)\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
							{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
							{ "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
							{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
						},
					},
					validate = true,
					includeLanguages = {
						vue = "html",
						typescript = "javascript",
						typescriptreact = "javascript",
					},
				},
			},
		},
		-- Document colors for Tailwind classes
		document_color = {
			enabled = true,
			kind = "inline",
			inline_symbol = "󰝤 ",
			debounce = 200,
		},
		-- Class concealing (hide long class strings)
		conceal = {
			enabled = false, -- Can be toggled with keymaps if desired
			min_length = nil,
			symbol = "󱏿",
			highlight = {
				fg = "#38BDF8",
			},
		},
		-- Completion integration
		completion = {
			enabled = true,
		},
		-- Custom filetypes to enable tailwind tools
		custom_filetypes = {},
	}
}
