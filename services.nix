{ config, lib, pkgs, ... }:

{
  # Enable the OpenSSH daemon
  services.openssh.enable = true;

  # Enable Cloudflare WARP for Zero Trust network access
  services.cloudflare-warp.enable = true;
}
