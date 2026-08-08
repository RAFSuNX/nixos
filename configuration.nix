{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./services.nix
    ./users.nix
    ./packages.nix
    ./wayland.nix
    ./nvidia.nix
  ];

  time.timeZone = "Asia/Dhaka";
  environment.localBinInPath = true;

  system.stateVersion = "26.05";
}
