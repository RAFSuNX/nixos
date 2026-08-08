{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.bash.shellAliases = {
    snrs = "sudo nixos-rebuild switch";
    docker = "docker --network=host";
  };

  environment.systemPackages = with pkgs; [
    wget
    gh
    git
    google-chrome
    kitty
    claude-code
    slack

    # Hyprland ecosystem
    awww
    waybar
    swaynotificationcenter
    rofi
    hyprlock
    matugen
    wl-clipboard

    # Media & input
    playerctl
    brightnessctl
    pavucontrol

    # Screenshots
    grim
    slurp
    libnotify

    # File manager
    thunar

    # Fonts & icons
    nerd-fonts.jetbrains-mono
    papirus-icon-theme

    # Scripting utilities
    jq
    lm_sensors
    psmisc
    networkmanagerapplet
    nodejs
    bun
    imagemagick
    glib
    uv
    python313
  ];
}
