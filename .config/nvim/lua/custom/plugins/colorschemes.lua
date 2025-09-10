return
{ -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	'folke/tokyonight.nvim',
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require('tokyonight').setup {
			transparent = true,
			styles = {
				comments = { italic = false }, -- Disable italics in comments
				sidebars = 'transparent',
				floats = 'transparent',
			},
			on_colors = function(c)
				-- Because lualine broke stuff with the latest commit
				c.bg_statusline = c.none
			end,
			on_highlights = function(hl, c)
				-- TabLineFill is currently set to black
				hl.TabLineFill = {
					bg = c.none,
				}
			end,
		}

		-- Load the colorscheme here.
		-- Like many other themes, this one has different styles, and you could load
		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.cmd.colorscheme 'tokyonight-night'
	end,
}
-- {                 -- You can easily change to a different colorscheme.
-- 	'olimorris/onedarkpro.nvim',
-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
-- }
-- {
-- 	"rose-pine/neovim",
-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
-- 	name = "rose-pine",
-- 	config = function()
-- 		require('rose-pine')
-- 		setup {
-- 			transparent = true,
-- 			styles = {
-- 				comments = { italic = false }, -- Disable italics in comments
-- 				sidebars = 'transparent',
-- 				floats = 'transparent',
-- 			},
-- 		}
-- 		vim.cmd("colorscheme rose-pine")
-- 	end
-- }
