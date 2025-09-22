return {
  dir = '/home/user/_dev/fun/neovim-theme-builder/neovim-theme-sync',
  lazy = false,
  name = 'theme-sync',
  config = function()
    require('theme-sync').setup {
      server_url = 'http://localhost:3004',
    }
  end,
}
