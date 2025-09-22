-- Auto-save configuration
local autosave_config = {
  enabled = true,
  timeout = 1000, -- 20 seconds
  notify = false,
  skip_filetypes = { 'gitcommit', 'gitrebase', 'help', 'neo-tree' },
}

-- Set the wait time
vim.opt.updatetime = autosave_config.timeout

-- Create the autocommand
local autosave_group = vim.api.nvim_create_augroup('AutoSave', { clear = true })

vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  group = autosave_group,
  pattern = '*',
  callback = function()
    if not autosave_config.enabled then
      return
    end

    -- Skip if buffer is not modifiable or has no name
    if not vim.bo.modifiable or vim.fn.expand '%' == '' then
      return
    end

    -- Skip certain filetypes
    if vim.tbl_contains(autosave_config.skip_filetypes, vim.bo.filetype) then
      return
    end

    -- Only save if buffer is modified
    if vim.bo.modified then
      local ok, err = pcall(vim.cmd, 'silent! write')
      if ok and autosave_config.notify then
        vim.notify('📁 ' .. vim.fn.expand '%:t', vim.log.levels.INFO, {
          timeout = 1000,
          title = 'Auto-saved',
        })
      elseif not ok then
        vim.notify('Auto-save failed: ' .. err, vim.log.levels.ERROR)
      end
    end
  end,
})

-- Toggle function
vim.api.nvim_create_user_command('AutoSaveToggle', function()
  autosave_config.enabled = not autosave_config.enabled
  vim.notify('Auto-save ' .. (autosave_config.enabled and 'enabled' or 'disabled'))
end, {})
