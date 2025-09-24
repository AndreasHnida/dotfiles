return {
  {
    'panghu-huang/theme-picker.nvim',
    lazy = false,
    opts = {
      -- Options passed to Telescope
      picker = {
        layout_config = {
          width = 0.35,
          height = 0.5,
        },
        -- ...
      },
      themes = {
        {
          name = 'Theme Sync',
          colorscheme = 'theme-sync',
        },
        {
          name = 'Tokyo Night (Night)',
          colorscheme = 'tokyonight-night',
        },
        {
          name = 'Tokyo Night (Night)',
          colorscheme = 'tokyonight-night',
        },
        {
          name = 'Rose Pine',
          colorscheme = 'rose-pine',
        },
        {
          name = 'Nord',
          colorscheme = 'nord',
        },
        {
          name = 'Nord Vivid',
          colorscheme = 'nord-vivid',
        },
        {
          name = 'One Dark (Dark)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'dark',
            }
          end,
        },
        {
          name = 'One Dark (Darker)',
          colorscheme = 'onedark',
          before = function()
            vim.g.onedark_config = {
              style = 'darker',
            }
          end,
        },
        -- Add more themes
      },
    },
    vim.keymap.set('n', '<leader>tp', '<cmd>:lua require("theme-picker").open_theme_picker()<cr>', { desc = 'Open theme picker' }),
  },
}
