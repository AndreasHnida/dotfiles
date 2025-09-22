local config = {
  tabline = 'bufferline',
}

local plugin_specs = {
  {
    'akinsho/bufferline.nvim',
    enabled = config.tabline == 'bufferline',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup {
        options = {
          custom_filter = function(buf_number, buf_numbers)
            local buf_name = vim.fn.bufname(buf_number)

            -- Exclude buffers with "claude" in the name (case insensitive)
            if buf_name:lower():match 'claude' then
              return false
            end

            return true
          end,
          max_name_length = 18,
          max_prefix_length = 15,
          truncate_names = true,
          mode = 'buffers', -- oder "tabs", je nach Geschmack
          diagnostics = 'nvim_lsp',
          separator_style = { ' ', ' ' }, -- "slant", "thick", "thin" etc.
          show_close_icon = false,
          show_buffer_close_icons = false,
          always_show_bufferline = true,
          -- indicator_icon = '',
          indicator = {
            style = 'none', -- no extra indicator
          },
        },
      }
      -- Keymaps: Tab / Shift-Tab zum Wechseln
      vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next tab' })
      vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev tab' })
    end,
  },
  {
    'romgrk/barbar.nvim',
    enabled = config.tabline == 'barbar',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    config = function()
      require('barbar').setup {
        animation = true,
        auto_hide = false,
        clickable = true,

        icons = {
          buffer_index = false,
          buffer_number = false,
          button = '',
          separator = { left = '', right = '' }, -- no separators
          separator_at_end = false,
          modified = { button = '●' },
          pinned = { button = '', filename = true },
          preset = 'default',

          filetype = {
            custom_colors = 'BufferCurrentIcon',
            enabled = true,
          },

          inactive = { button = '' },
        },

        maximum_padding = 1,
        minimum_padding = 1,
        maximum_length = 30,
        minimum_length = 0,
      }
      -- Current buffer - neon green with icon
      vim.api.nvim_set_hl(0, 'BufferCurrent', {
        fg = '#000000',
        bg = ' ',
        bold = true,
      })

      vim.api.nvim_set_hl(0, 'BufferCurrentMod', {
        fg = '#000000',
        bg = '',
        bold = true,
      })

      -- IMPORTANT: Fix the filetype icon background
      vim.api.nvim_set_hl(0, 'BufferCurrentIcon', {
        fg = '#000000', -- black icon
        bg = '#00ff41', -- same neon green background
      })

      -- Remove all separators/signs
      vim.api.nvim_set_hl(0, 'BufferCurrentSign', {
        fg = '#00ff41',
        bg = 'NONE',
      })

      vim.api.nvim_set_hl(0, 'BufferCurrentSignRight', {
        fg = '#00ff41',
        bg = 'NONE',
      })

      -- Inactive buffers - transparent
      vim.api.nvim_set_hl(0, 'BufferInactive', {
        fg = '#6c7086',
        bg = 'NONE',
      })

      vim.api.nvim_set_hl(0, 'BufferInactiveMod', {
        fg = '#f38ba8',
        bg = 'NONE',
      })

      vim.api.nvim_set_hl(0, 'BufferInactiveIcon', {
        fg = '#6c7086', -- dim icon for inactive
        bg = 'NONE',
      })

      vim.api.nvim_set_hl(0, 'BufferInactiveSign', {
        fg = '#000000',
        bg = '#000000',
      })

      vim.api.nvim_set_hl(0, 'BufferInactiveSignRight', {
        fg = 'NONE',
        bg = 'NONE',
      })

      -- Visible buffers
      vim.api.nvim_set_hl(0, 'BufferVisible', {
        fg = '#00ff41',
        bg = 'NONE',
      })

      vim.api.nvim_set_hl(0, 'BufferVisibleIcon', {
        fg = '#9399b2',
        bg = 'NONE',
      })

      vim.api.nvim_set_hl(0, 'BufferVisibleSign', {
        fg = '#00ff41',
        bg = '#99ff41',
      })

      vim.api.nvim_set_hl(0, 'BufferVisibleSignRight', {
        fg = 'NONE',
        bg = 'NONE',
      })

      -- Background
      vim.api.nvim_set_hl(0, 'BufferTabpageFill', {
        bg = 'NONE',
      })

      vim.api.nvim_set_hl(0, 'BufferTabpagesSep', {
        bg = '#00ff41',
        fg = '#00ff41',
      })
    end,
  },
}

return plugin_specs
