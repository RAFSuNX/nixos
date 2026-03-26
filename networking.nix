{ config, lib, pkgs, ... }:

{
  networking.hostName = "systemx";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ 22 ];
  networking.firewall.enable = true;
}
