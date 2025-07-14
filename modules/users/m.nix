# modules/users/m.nix

{ config, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.m = {
    isNormalUser = true;
    description = "Martin Garcia";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
