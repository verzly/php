# Composer Installation Script for Windows
# Usage: powershell -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/verzly/php/master/composer/install.ps1'))"

Write-Host "📦 Installing Composer for Windows..." -ForegroundColor Green

# Temp directory
$TempDir = $env:TEMP
$InstallerPath = "$TempDir\composer-setup.php"
$ComposerPath = "C:\bin\composer.bat"

# Create C:\bin if it doesn't exist
if (-not (Test-Path "C:\bin")) {
  New-Item -ItemType Directory -Path "C:\bin" | Out-Null
}

# Download installer
Write-Host "⬇️  Downloading Composer installer..." -ForegroundColor Cyan
(New-Object Net.WebClient).DownloadFile('https://getcomposer.org/installer', $InstallerPath)

# Install Composer
Write-Host "🔧 Installing Composer..." -ForegroundColor Cyan
php $InstallerPath --install-dir=C:\bin --filename=composer.bat

# Cleanup
Remove-Item $InstallerPath -Force -ErrorAction SilentlyContinue

# Verify installation
Write-Host "✅ Checking installation..." -ForegroundColor Green
$ComposerVersion = & php C:\bin\composer.bat --version 2>$null

if ($ComposerVersion) {
  Write-Host "✨ Success! $ComposerVersion" -ForegroundColor Green
  Write-Host "💡 Add C:\bin to your PATH to use 'composer' from anywhere" -ForegroundColor Yellow
} else {
  Write-Host "❌ Installation failed. Make sure PHP is installed and in PATH." -ForegroundColor Red
  exit 1
}
