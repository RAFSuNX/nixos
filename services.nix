{ config, lib, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable Cloudflare WARP for Zero Trust network access.
  services.cloudflare-warp.enable = true;

  # Enable CUPS printing service.
  services.printing.enable = true;

  # Enable Bluetooth hardware support.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # Power on Bluetooth controller on boot
  };

  # Enable Blueman service for Bluetooth management GUI.
  services.blueman.enable = true;

  # Enable KVM/libvirt for virtual machines.
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Enable Tailscale VPN.
  services.tailscale.enable = true;

}
