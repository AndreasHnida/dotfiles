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
          name = 'Tokyo Night (Night)',
          colorscheme = 'tokyonight-night',
        },
        {
          name = 'Tokyo Night (Storm)',
          colorscheme = 'tokyonight-storm',
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
  },
}
