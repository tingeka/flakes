# modules/core/boot-systemd.nix
{ config, ... }: {
  boot.loader.grub.enable              = false;
  boot.loader.systemd-boot.enable     = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # no device to set—systemd‑boot uses your ESP automatically
}
