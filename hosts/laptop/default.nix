{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./modules.nix
  ];

  # In your VM the disk is /dev/vda:
  boot.loader.grub.device = "/dev/vda";

  # any last‑minute host‑wide overrides can live here:
  # e.g. disable pipewire entirely:
  # services.pipewire.enable = false;
}
