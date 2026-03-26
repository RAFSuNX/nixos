{ config, lib, pkgs, ... }:

{
  imports = [
    # Hardware
    ./hardware-configuration.nix
    ./mounts.nix
    ./nvidia.nix

    # System configuration
    ./boot.nix
    ./networking.nix
    ./users.nix

    # Services & Desktop
    ./services.nix
    ./desktop.nix
  ];

  # Set your time zone.
  time.timeZone = "Asia/Dhaka";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # System utilities
    nano
    wget

    # Development tools
    claude-code
    nodejs_24
    gh
    git
    curl
    kubectl

    # CLI tools
    cloudflare-warp
  ];

  nixpkgs.config.allowUnfree = true;

  # This value defines the first version of NixOS you have installed.
  # Do NOT change this value unless you have manually inspected all changes.
  system.stateVersion = "25.11";
}
