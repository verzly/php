#!/bin/bash
# Composer Installation Script for Linux & macOS
# Usage: bash <(curl -fsSL https://raw.githubusercontent.com/verzly/php/master/composer/install.sh)

set -e

echo "📦 Installing Composer for $(uname -s)..."

# Check if PHP is installed
if ! command -v php &> /dev/null; then
  echo "❌ PHP is not installed. Please install PHP first."
  exit 1
fi

# Detect install directory
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  INSTALL_DIR="/usr/local/bin"
else
  # Linux
  INSTALL_DIR="/usr/local/bin"
fi

# Check if we need sudo
if [ ! -w "$INSTALL_DIR" ]; then
  SUDO="sudo"
else
  SUDO=""
fi

echo "⬇️  Downloading Composer installer..."
TEMP_FILE=$(mktemp)
curl -fsSL https://getcomposer.org/installer -o "$TEMP_FILE"

echo "🔧 Installing Composer..."
$SUDO php "$TEMP_FILE" --install-dir="$INSTALL_DIR" --filename=composer

# Cleanup
rm -f "$TEMP_FILE"

# Verify installation
echo "✅ Checking installation..."
COMPOSER_VERSION=$(composer --version)

if [ $? -eq 0 ]; then
  echo "✨ Success! $COMPOSER_VERSION"
  echo "💡 Composer is now available globally as 'composer'"
else
  echo "❌ Installation failed."
  exit 1
fi
