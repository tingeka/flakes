# modules/programs/mtr.nix
{ config, ... }: {
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true
}
