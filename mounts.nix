{ config, lib, pkgs, ... }:

{
  systemd.mounts = [
    {
      description = "SD card";
      what = "/dev/disk/by-uuid/FF7F-77A7";
      where = "/mnt/sdcard";
      type = "exfat";
      options = "nofail,uid=1000,gid=100";
      wantedBy = [ "multi-user.target" ];
      after = [ "local-fs.target" ];
      unitConfig.JobTimeoutSec = "30s";
    }
  ];
}
