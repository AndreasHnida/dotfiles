return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require('themery').setup {
      themes = { 'nord', 'nord-vivid', 'bearded-theme', 'tokyonight', 'rose-pine', 'onedark' },
      livePreview = true,
    }
  end,
}
