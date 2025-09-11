#!/bin/bash

echo "Testing nvim-snacks configuration..."

# Test if Neovim can start with the new config
NVIM_APPNAME=nvim-snacks nvim --headless -c "echo 'Config loaded successfully'" -c "qa" 2>&1

if [ $? -eq 0 ]; then
    echo "✓ Configuration loads without errors"
else
    echo "✗ Configuration has errors"
    exit 1
fi

# Check if lazy.nvim will install plugins
echo ""
echo "Checking plugin installation..."
NVIM_APPNAME=nvim-snacks nvim --headless -c "Lazy! sync" -c "qa" 2>&1 | tail -5

echo ""
echo "Configuration test complete!"
echo ""
echo "To use the new configuration, run:"
echo "  NVIM_APPNAME=nvim-snacks nvim"
echo ""
echo "Or set an alias:"
echo "  alias nvim-snacks='NVIM_APPNAME=nvim-snacks nvim'"