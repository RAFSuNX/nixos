{ config, lib, pkgs, ... }:

{
  # Hyprland window manager.
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true; # Recommended in 2026 for session management
  };

  # SDDM Display Manager (Wayland).
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings = {
      General = {
        InputMethod = "";
      };
    };
  };

  # Desktop-related packages.
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty

    # Hyprland essentials
    rofi
    wl-clipboard
    waybar
    hyprlock

    # Utilities
    jq
    imagemagick
    grim
    slurp
    matugen
    awww
    swaynotificationcenter

    # System controls
    playerctl
    brightnessctl
    pamixer
    pavucontrol
    libnotify
    networkmanagerapplet

    # Applications
    google-chrome
    jellyfin-media-player
    thunar
    imv
  ];

  # Enable touchpad support.
  services.libinput.enable = true;

  # Enable PipeWire for audio.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

}
