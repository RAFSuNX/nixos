# NixOS Configuration

Modular NixOS configuration for system "systemx" with Hyprland, NVIDIA GPU support, and development tools.

## Structure

```
nixos/
├── configuration.nix       # Main configuration file
├── boot.nix               # Boot loader configuration
├── networking.nix         # Network, hostname, and firewall
├── users.nix              # User accounts and sudo rules
├── desktop.nix            # Hyprland, SDDM, desktop packages
├── services.nix           # OpenSSH, Cloudflare WARP
├── nvidia.nix             # NVIDIA GPU configuration
├── mounts.nix             # SD card mount configuration
└── hardware-configuration.nix  # Auto-generated hardware scan
```

## Features

- **Desktop Environment**: Hyprland (Wayland compositor)
- **Display Manager**: SDDM
- **Graphics**: NVIDIA RTX with hybrid graphics (PRIME offload)
- **Audio**: PipeWire
- **Development**: Node.js, Git, kubectl, Claude Code
- **Services**: OpenSSH, Cloudflare WARP

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/rafsunx/nixos.git
   ```

2. Review and customize the configuration files for your system

3. Update hardware-configuration.nix:
   ```bash
   sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
   ```

4. Apply the configuration:
   ```bash
   sudo nixos-rebuild switch -I nixos-config=/path/to/nixos/configuration.nix
   ```

## Notes

- The configuration uses a flat directory structure for simplicity
- Hardware UUIDs and PCI bus IDs are specific to the original system
- NOPASSWD sudo is configured for the user account

## System Version

NixOS 25.11
