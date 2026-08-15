{ config, lib, pkgs, ... }:

{
  networking.hostName = "systemx";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3000 8000 8080 ];
  };

  # Default DNS when no VPN is active. WARP overrides this when connected
  # (required for its DoH mode), then resolvconf restores these on disconnect.
  networking.nameservers = [ "1.1.1.1" "1.0.0.1" "8.8.8.8" "9.9.9.9" ];
}
