# nixfiles - NixOS Configuration
This repository contains the configuration files and settings for my NixOS machine. It is designed to be modular, reproducible, and easily maintainable. The setup includes configurations for system packages, user environments, and various tools and services that I use on a daily basis.

## Table of Contents
- [Overview](#overview)
- [Structure](#structure)
- [Usage](#usage)
- [License](#license)

## Overview
This configuration is designed to streamline the setup and management of my NixOS environment. It includes:

- **System Configuration**: Kernel settings, hardware drivers, and essential system packages.
- **User Environment**: Shell configuration, desktop environment, and user-specific applications.
- **Development Tools**: Settings for programming languages, editors, and version control.
- **Security**: Encrypted secrets management using `sops-nix`.
- **Custom Modules**: Modularized Nix configurations for easier customization.

## Structure
The repository is organized as follows:

```
nixfiles/
├── home/                   # User-specific configurations
│   └── shared/             # Shared configurations for Home Manager
├── hosts/                  # Host-specific configurations
│   ├── shared/             # Shared configurations across hosts
│   │   └── users/          # User configurations
│   └── test/               # Configurations for testing environment
├── imgs/                   # Images or assets related to the configurations
├── modules/                # NixOS and Home Manager modules
│   ├── home-manager/
│   └── nixos/
├── overlays/               # Nix overlays for customization
└── pkgs/                   # Custom nixpkgs package
```

## Usage
### Building the Configuration
To build and apply the configuration:
```bash
sudo nixos-rebuild switch --flake .
# or
home-manager switch --flake .
```
> Alternatively, you can use [nh](https://github.com/viperML/nh), which is installed in this configuration.

## License
This repository is licensed under the [MIT License](LICENSE).
