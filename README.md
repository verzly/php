# PHP Releases for Linux, macOS, and Windows

This repository was created to centralize PHP releases for both Linux, macOS, and Windows, ensuring consistency and ease of access.

## The Problem

PHP releases are published separately on two different platforms:
- [php.net](https://www.php.net/downloads) for Linux, macOS
- [windows.php.net](https://windows.php.net/download/) for Windows

Additionally, Windows ZIP archives follow inconsistent naming conventions, making it difficult to automate version tracking and distribution.

## The Solution

This repository auto matically monitors new PHP releases and generates a **executable** for each version. Each release includes:
- Linux x86_64 build (built with static-php-cli [bulk](https://dl.static-php.dev/static-php-cli/bulk) variant)
- Linux aarch64 build (built with static-php-cli [bulk](https://dl.static-php.dev/static-php-cli/bulk) variant)
- macOS x86_64 build (built with static-php-cli [bulk](https://dl.static-php.dev/static-php-cli/bulk) variant)
- macOS aarch64 build (built with static-php-cli [bulk](https://dl.static-php.dev/static-php-cli/bulk) variant)
- Windows x86_64 build (built with static-php-cli [spc-max](https://dl.static-php.dev/static-php-cli/windows/spc-max) variant)

## Usage

The repository is compatible with [ubi](https://github.com/houseabsolute/ubi).

### mise-en-place

It is recommended to install the binaries via [mise-en-place](https://github.com/jdx/mise).

```bash
# Latest PHP major
mise use ubi:verzly/php@latest

# Latest PHP 8 minor, patch
mise use ubi:verzly/php@8

# Latest PHP 8.4 patch
mise use ubi:verzly/php@8.4

# Only PHP 8.4.3 patch
mise use ubi:verzly/php@8.4.3
```

### Download Releases

You can find all available versions in the [Releases Section](../../releases).

### Missing a Version?

If you notice a missing release or any issues with the packages, please [open an issue](../../issues) to let us know.

## Composer for PHP

### Linux & macOS

```none
bash <(curl -fsSL https://raw.githubusercontent.com/verzly/php/master/composer/install.sh)
```

### Windows

```none
powershell -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/verzly/php/master/composer/install.ps1'))"
```
