{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.rafsunx = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable 'sudo' for the user.
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
