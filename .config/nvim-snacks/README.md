# Neovim Configuration with Snacks.nvim

This is your Neovim configuration migrated to use **snacks.nvim** - a comprehensive collection of QoL plugins by folke.

## What's Been Replaced

The following plugins have been replaced by snacks.nvim modules:

- **telescope.nvim** → `snacks.picker` (file/buffer/git/LSP searching)
- **nvim-notify** → `snacks.notifier` (notifications)
- **noice.nvim** → `snacks.notifier` (command line UI)
- **bufferline.nvim** → `snacks.bufdelete` (buffer management)
- **mini.indentscope** → `snacks.indent` (indent guides)
- **Dashboard** → `snacks.dashboard` (start screen)
- **Terminal keymaps** → `snacks.terminal` (better terminal integration)

## Preserved Plugins

The following plugins are kept as you requested:
- **yazi.nvim** - Your favorite file manager plugin

## Key Mappings

All your original keymappings have been preserved and migrated:

### File Navigation
- `<leader><leader>` - Find files
- `<leader>sg` - Search by grep
- `<leader>sw` - Search current word
- `<leader>sb` - Buffers
- `<leader>e` - File explorer
- `<C-A-p>` - Recent files

### Terminal
- `<leader>tt` - Terminal (horizontal)
- `<leader>tv` - Terminal (vertical)
- `<leader>tf` - Terminal (float)
- `<C-/>` - Toggle floating terminal

### Buffer Management
- `q` - Delete buffer
- `<leader>bd` - Delete buffer
- `<leader>bo` - Delete other buffers

### Git
- `<leader>gb` - Git blame line
- `<leader>gB` - Git blame file
- `<leader>gs` - Git status
- `<leader>gl` - Git log
- `]h` / `[h` - Navigate hunks

### Utility
- `<leader>z` - Zen mode
- `<leader>n` - Notification history
- `<leader>D` - Dashboard

## How to Use

1. **Run with isolated config:**
   ```bash
   NVIM_APPNAME=nvim-snacks nvim
   ```

2. **Create an alias for convenience:**
   ```bash
   alias nvs='NVIM_APPNAME=nvim-snacks nvim'
   ```

3. **First time setup:**
   - Open Neovim with the new config
   - Run `:Lazy` to install/update plugins
   - Restart Neovim

## Features

### Snacks.nvim Modules Enabled

- **Dashboard** - Beautiful start screen
- **Notifier** - Modern notifications
- **Picker** - Fast file/buffer/git searching
- **Terminal** - Better terminal integration
- **Git** - Git integration and blame
- **Indent** - Animated indent guides
- **Explorer** - File tree explorer
- **Bufdelete** - Smart buffer deletion
- **Zen** - Distraction-free mode
- **Words** - LSP reference highlighting
- **Scroll** - Smooth scrolling
- **Rename** - LSP-integrated renaming
- **Debug** - Better debugging tools

## Troubleshooting

If you encounter issues:

1. Clear the plugin cache:
   ```bash
   rm -rf ~/.local/share/nvim-snacks
   rm -rf ~/.local/state/nvim-snacks
   ```

2. Reinstall plugins:
   ```bash
   NVIM_APPNAME=nvim-snacks nvim +Lazy +q
   ```

3. Check for errors:
   ```bash
   NVIM_APPNAME=nvim-snacks nvim -c ':checkhealth'
   ```

## Reverting

Your original config is untouched at `~/.config/nvim/`
To revert, simply use nvim without the NVIM_APPNAME variable.