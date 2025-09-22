return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          section_separators = '',
          component_separators = '',
        },
        sections = {
          lualine_x = {
            function()
              return require('theme-sync').get_status()
            end,
          },
        },
      }
    end,
  },
}
