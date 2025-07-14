# modules/services/openssh.nix
{ config, ... }: {
  # Enable the OpenSSH daemon
  services.openssh.enable = true;
}
