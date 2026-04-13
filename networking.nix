{ config, lib, pkgs, ... }:

{
  networking.hostName = "systemx";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager = {
    enable = true;
    dns = "none"; # Disable NetworkManager DNS management to force our DNS
  };

  # DNS Configuration: Cloudflare (primary) and Google (secondary)
  # These will be used always, even when WARP VPN is active
  networking.nameservers = [
    # Cloudflare DNS (IPv4)
    "1.1.1.1"
    "1.0.0.1"
    # Cloudflare DNS (IPv6)
    "2606:4700:4700::1111"
    "2606:4700:4700::1001"
    # Google DNS (IPv4)
    "8.8.8.8"
    "8.8.4.4"
    # Google DNS (IPv6)
    "2001:4860:4860::8888"
    "2001:4860:4860::8844"
  ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 8081 ];
  networking.firewall.allowedUDPPorts = [ 22 ];
  networking.firewall.enable = true;
}
