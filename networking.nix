{ config, lib, pkgs, ... }:

{
  networking.hostName = "systemx";
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 3000 8000 8080 ];
  };
}
