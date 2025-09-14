return {
  {
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
    end,
  },

  {
    'xStormyy/bearded-theme.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      vim.g.bearded_transparent = true
    end,
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('onedarkpro').setup {
        options = {
          transparency = true,
        },
      }
    end,
  },
  {
    'shaunsingh/nord.nvim',
    priority = 1000,
    config = function()
      -- Configure nord.nvim for transparent background
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_cursorline_transparent = true
      vim.g.nord_enable_sidebar_background = false
      require('nord').set()
    end,
  },
  {
    'AndreasHnida/nord-vivid.nvim',
    priority = 1000,
    config = function()
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_cursorline_transparent = true
      vim.g.nord_enable_sidebar_background = false
      require('nord-vivid').set()
    end,
  },
  {
    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        transparent = true,
        styles = {
          comments = { italic = false }, -- Disable italics in comments
          sidebars = 'transparent',
          floats = 'transparent',
        },
      }
    end,
  },
}
