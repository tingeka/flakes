# modules/core/boot.nix
{ config, ... }:

{
  # Enable GRUB and scan for other OSes (Windows, etc.)
  boot.loader.grub.enable      = true;
  boot.loader.grub.useOSProber = true;

  # ── No `boot.loader.grub.device` here ──
  # Each host must set it explicitly (e.g. "/dev/vda" or "/dev/nvme0n1")
  # boot.loader.grub.device = "/dev/vda"
}
