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
}
