{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    ./modules.nix
  ];

  # any last‑minute host‑wide overrides can live here:
  # e.g. disable pipewire entirely:
  # services.pipewire.enable = false;
}
