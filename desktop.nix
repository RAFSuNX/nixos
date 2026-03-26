{ config, lib, pkgs, ... }:

{
  # Hyprland window manager
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true; # Recommended in 2026 for session management
  };

  # SDDM Display Manager (Wayland)
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Desktop-related packages
  environment.systemPackages = with pkgs; [
    # Terminal
    kitty

    # Hyprland essentials
    rofi
    wl-clipboard
    waybar

    # Utilities
    jq
    imagemagick
    grim
    slurp
    matugen
    swww
    swaynotificationcenter

    # System controls
    playerctl
    brightnessctl
    pamixer
    libnotify
    networkmanagerapplet

    # Applications
    google-chrome
    jellyfin-media-player
  ];

  # Enable touchpad support
  services.libinput.enable = true;

  # Enable PipeWire for audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Wayland environment variable
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
