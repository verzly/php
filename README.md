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

### mise-en-place via `ubi` backend

It is recommended to install the binaries via [mise-en-place](https://github.com/jdx/mise).

> [!WARNING]
> The `ubi` backend has been deprecated in newer Mise-en-Place releases; it's recommended to use the `github` backend instead, although it is still under development.

```bash
# Latest PHP major
mise use ubi:verzly/php@latest

# Latest PHP 8 minor, patch
mise use ubi:verzly/php@8

# Latest PHP 8.4 patch
mise use ubi:verzly/php@8.4

# Only PHP 8.4.3 patch
mise use ubi:verzly/php@8.4.3

# Check installed PHP versions
mise ls ubi:verzly/php

# Change globally selected PHP version
mise use -g ubi:verzly/php@8 # or latest or 8.4 or 8.4.3

# Check current PHP version
php --version
```

### mise-en-place via `github` backend

It is recommended to install the binaries via [mise-en-place](https://github.com/jdx/mise).

Install it as a PHP alias to avoid constantly using the long backend reference. It's important to set the alias before installing the first PHP version; otherwise, mise ls will list your PHP versions in two separate entries (it won't handle the original name and the alias together).

```bash
mise plugin rm php
mise config set tool_alias.php github:verzly/php
```

> [!WARNING]
> Unfortunately, it currently only works with full version numbers. See more: https://github.com/jdx/mise/discussions/8215

```bash
# [CURRENTLY UNAVAILABLE] Latest PHP major - See warning above.
mise use php@latest

# [CURRENTLY UNAVAILABLE] Latest PHP 8 minor, patch - See warning above.
mise use php@8

# [CURRENTLY UNAVAILABLE] Latest PHP 8.4 patch - See warning above.
mise use php@8.4

# Only PHP 8.4.3 patch
mise use php@8.4.3

# Check installed PHP versions
mise ls php

# Change globally selected PHP version
mise use -g php@8.4.3

# Check current PHP version
php --version
```

### Download Releases

You can find all available versions in the [Releases Section](../../releases).

### Missing a Version?

If you notice a missing release or any issues with the packages, please [open an issue](../../issues) to let us know.

## Composer for PHP

In the case of Composer, it is very rare to require different versions. Therefore, instead of collecting multiple versions, we can install the official Composer using a single script without any extra steps.

**Linux & macOS**

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/verzly/php/master/composer/install.sh)
```

**Windows**

```bash
powershell -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/verzly/php/master/composer/install.ps1'))"
```

To update or install a specific version, we can use Composer's built-in self-update command:

```bash
# Latest Composer major
composer self-update

# Latest Composer 2 minor, patch
composer self-update 2

# Latest Composer 2.7 patch
composer self-update 2.7

# Only Composer 2.7.9 patch
composer self-update 2.7.9

# Roll back to the previous version
composer self-update --rollback

# Update to latest preview/RC version
composer self-update --preview

# Update to latest snapshot/development version
composer self-update --snapshot

# Check current Composer version
composer --version
```
