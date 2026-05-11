{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.rafsunx = {
    isNormalUser = true;
    subUidRanges = [{ startUid = 100000; count = 65536; }];
    subGidRanges = [{ startGid = 100000; count = 65536; }];
    extraGroups = [ "wheel" "docker" "adbusers" "libvirtd" "kvm" ]; # Enable 'sudo', Docker, ADB, and KVM for the user
    packages = with pkgs; [
      tree
      slack
    ];
  };

  security.sudo.extraRules = [{
    users = [ "rafsunx" ];
    commands = [{ command = "ALL"; options = [ "NOPASSWD" ]; }];
  }];
}
