{ config, pkgs, ... }:
let
  serviceConfig = pkgs.writeText "nbfc.json" ''
    { "SelectedConfigId": "Acer Nitro AN515-42" }
  '';
in {
  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [ pkgs.kmod ];
    script = "${pkgs.nbfc-linux}/bin/nbfc_service --config-file '${serviceConfig}'";
    wantedBy = [ "multi-user.target" ];
  };
}
