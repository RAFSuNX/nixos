{ config, lib, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.nix-ld.enable = true;

  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      dns = [ "1.1.1.1" "8.8.8.8" ];
      bridge = "none";
    };
  };

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --cmd start-hyprland";
      user = "rafsunx";
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.libinput.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
