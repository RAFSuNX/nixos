{ config, lib, pkgs, ... }:

{
  imports = [
    # Hardware
    ./hardware-configuration.nix
    ./mounts.nix
    ./nvidia.nix
    ./nbfc.nix

    # System configuration
    ./boot.nix
    ./networking.nix
    ./users.nix

    # Services & Desktop
    ./services.nix
    ./desktop.nix
  ];

  # Enable redistributable firmware (WiFi, Bluetooth, GPU microcode, etc).
  hardware.enableRedistributableFirmware = true;

  # Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure console keymap.
  console.keyMap = "us";

  # Configure X11/Wayland keymap.
  services.xserver.xkb.layout = "us";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # System utilities
    nano
    wget
    fastfetch
    sshpass
    iw
    bc
    git
    curl
    android-tools
    claude-code

    # Kubernetes / GitOps
    gh
    kubectl
    age
    fluxcd
    sops
    kubernetes-helm

    # Containers
    distrobox
    podman
    podman-compose

    # Media
    ffmpeg-full
    vlc

    # Fan control
    nbfc-linux

    # Network
    cloudflare-warp
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.nix-ld.enable = true;

  swapDevices = [{ device = "/var/lib/swapfile"; size = 4 * 1024; }];

  nixpkgs.config.allowUnfree = true;

  # This value defines the first version of NixOS you have installed.
  # Do NOT change this value unless you have manually inspected all changes.
  system.stateVersion = "25.11";
}
