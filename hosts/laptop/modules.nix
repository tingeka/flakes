{ config, pkgs, lib, inputs, ... }:
{
  imports = [

    ../../modules/core/boot-grub.nix
    ../../modules/core/networking.nix

    ../../modules/common/packages.nix

    ../../modules/services/x11.nix
    ../../modules/services/printing.nix
    ../../modules/services/pipewire.nix
    ../../modules/services/plasma6.nix
    ../../modules/services/sddm.nix

    ../../modules/users/m.nix

    # Home Manager
    inputs.home-manager.nixosModules.home-manager
    ../../modules/home-manager/default.nix
  ];
}
