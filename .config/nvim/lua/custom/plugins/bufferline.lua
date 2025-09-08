return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- oder "tabs", je nach Geschmack
        diagnostics = 'nvim_lsp',
        separator_style = 'thin', -- "slant", "thick", "thin" etc.
        show_close_icon = false,
        show_buffer_close_icons = false,
        always_show_bufferline = false,
      },
      highlights = {
        fill = {
          bg = 'NONE', -- Transparent background
        },
        background = {
          bg = 'NONE',
        },
        tab = {
          bg = 'NONE',
        },
        tab_selected = {
          bg = 'NONE',
        },
        tab_separator = {
          bg = 'NONE',
        },
        tab_separator_selected = {
          bg = 'NONE',
        },
        tab_close = {
          bg = 'NONE',
        },
        close_button = {
          bg = 'NONE',
        },
        close_button_visible = {
          bg = 'NONE',
        },
        close_button_selected = {
          bg = 'NONE',
        },
        buffer_visible = {
          bg = 'NONE',
        },
        buffer_selected = {
          bg = 'NONE',
          bold = true,
          italic = false,
        },
        numbers = {
          bg = 'NONE',
        },
        numbers_visible = {
          bg = 'NONE',
        },
        numbers_selected = {
          bg = 'NONE',
        },
        diagnostic = {
          bg = 'NONE',
        },
        diagnostic_visible = {
          bg = 'NONE',
        },
        diagnostic_selected = {
          bg = 'NONE',
        },
        hint = {
          bg = 'NONE',
        },
        hint_visible = {
          bg = 'NONE',
        },
        hint_selected = {
          bg = 'NONE',
        },
        hint_diagnostic = {
          bg = 'NONE',
        },
        hint_diagnostic_visible = {
          bg = 'NONE',
        },
        hint_diagnostic_selected = {
          bg = 'NONE',
        },
        info = {
          bg = 'NONE',
        },
        info_visible = {
          bg = 'NONE',
        },
        info_selected = {
          bg = 'NONE',
        },
        info_diagnostic = {
          bg = 'NONE',
        },
        info_diagnostic_visible = {
          bg = 'NONE',
        },
        info_diagnostic_selected = {
          bg = 'NONE',
        },
        warning = {
          bg = 'NONE',
        },
        warning_visible = {
          bg = 'NONE',
        },
        warning_selected = {
          bg = 'NONE',
        },
        warning_diagnostic = {
          bg = 'NONE',
        },
        warning_diagnostic_visible = {
          bg = 'NONE',
        },
        warning_diagnostic_selected = {
          bg = 'NONE',
        },
        error = {
          bg = 'NONE',
        },
        error_visible = {
          bg = 'NONE',
        },
        error_selected = {
          bg = 'NONE',
        },
        error_diagnostic = {
          bg = 'NONE',
        },
        error_diagnostic_visible = {
          bg = 'NONE',
        },
        error_diagnostic_selected = {
          bg = 'NONE',
        },
        modified = {
          bg = 'NONE',
        },
        modified_visible = {
          bg = 'NONE',
        },
        modified_selected = {
          bg = 'NONE',
        },
        duplicate_selected = {
          bg = 'NONE',
        },
        duplicate_visible = {
          bg = 'NONE',
        },
        duplicate = {
          bg = 'NONE',
        },
        separator_selected = {
          bg = 'NONE',
        },
        separator_visible = {
          bg = 'NONE',
        },
        separator = {
          bg = 'NONE',
        },
        indicator_selected = {
          bg = 'NONE',
        },
        indicator_visible = {
          bg = 'NONE',
        },
        pick_selected = {
          bg = 'NONE',
        },
        pick_visible = {
          bg = 'NONE',
        },
        pick = {
          bg = 'NONE',
        },
        offset_separator = {
          bg = 'NONE',
        },
        trunc_marker = {
          bg = 'NONE',
        },
      },
    }

    -- Keymaps: Tab / Shift-Tab zum Wechseln
    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next tab' })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev tab' })
    vim.api.nvim_set_hl(0, 'BufferLineFill', { fg = '#ffffff' })

    vim.api.nvim_set_hl(0, 'BufferLineBackground', { fg = '#ffffff' })

    vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', { bold = true })

    vim.api.nvim_set_hl(0, 'BufferLineSeparator', { bg = 'NONE', fg = 'NONE' })

    vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', {})
  end,
}
