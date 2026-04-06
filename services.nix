{ config, lib, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable Cloudflare WARP for Zero Trust network access.
  services.cloudflare-warp.enable = true;

  # Enable Bluetooth hardware support.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # Power on Bluetooth controller on boot
  };

  # Enable Blueman service for Bluetooth management GUI.
  services.blueman.enable = true;

  # Enable Docker containerization platform.
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true; # Start Docker daemon on system boot
    enableNvidia = true; # Deprecated but actually works on NixOS 25.x
  };

  # Enable nbfc-linux for laptop fan control.
  services.nbfc.enable = true;
}
