# modules/home-manager/default.nix
{ config, pkgs, lib, inputs, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup"; # or whatever extension you prefer
    extraSpecialArgs = { inherit inputs; };

    users.m = {
      imports = [
        ./users/m.nix
      ];
    };
  };
}
