# modules/core/boot.nix
{ config, pkgs, lib, ... }:

let
  isX86_64 = pkgs.stdenv.hostPlatform.system == "x86_64-linux";
  rootDevice = config.fileSystems."/".device;
in
{
  boot.loader.grub.enable      = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device      = rootDevice;

  boot.kernelPackages = lib.mkDefault (
    if isX86_64
    then pkgs.linuxPackages_latest
    else pkgs.linuxPackages
  );
}
