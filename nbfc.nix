{ config, pkgs, ... }:
let
  myUser = "rafsunx";
  command = "bin/nbfc_service --config-file '/home/${myUser}/.config/nbfc.json'";
in {
  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [ pkgs.kmod ];
    script = "${pkgs.nbfc-linux}/${command}";
    wantedBy = [ "multi-user.target" ];
  };
}
