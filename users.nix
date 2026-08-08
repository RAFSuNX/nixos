{ config, lib, pkgs, ... }:

{
  users.users.rafsunx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "bluetooth" "disk" "docker" ];
    packages = with pkgs; [
      tree
    ];
  };
}
