# PHP Releases for Linux and Windows

This repository was created to centralize PHP releases for both Linux and Windows, ensuring consistency and ease of access.  

## The Problem  
PHP releases are published separately on two different platforms:  
- [php.net](https://www.php.net/downloads) for Linux  
- [windows.php.net](https://windows.php.net/download/) for Windows  

Additionally, Windows ZIP archives follow inconsistent naming conventions, making it difficult to automate version tracking and distribution.  

## The Solution  
This repository automatically monitors new PHP releases and generates a **standardized package** for each version. Each release includes:  
- One Linux build  
- One Windows x86 build  
- One Windows x64 build  

## Download Releases  
You can find all available versions in the [Releases Section](../../releases).  

## Missing a Version?  
If you notice a missing release or any issues with the packages, please [open an issue](../../issues) to let us know.  
