{ config, pkgs, ... }:

{
  boot.kernelModules = [ "wireguard" ];

  services.tailscale.enable = true;

  environment.systemPackages = [ pkgs.cloudflare-warp ];

  systemd.services.warp-svc = {
    description = "Cloudflare WARP daemon";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.cloudflare-warp}/bin/warp-svc";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };

  networking.firewall = {
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
    checkReversePath = "loose";
  };
}
