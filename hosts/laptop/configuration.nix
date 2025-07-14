{ config, ... }:

{
  # host‑specific settings:
  networking.hostName = "laptop";
  system.stateVersion   = "25.05";

  # Allow unfree software
  nixpkgs.config.allowUnfree = true;

  # per‑host user packages:
  users.users.m.packages = with pkgs; [ kdePackages.kate ];

    # Set your time zone.
  time.timeZone = "America/Argentina/Cordoba";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.UTF-8";
    LC_IDENTIFICATION = "es_AR.UTF-8";
    LC_MEASUREMENT = "es_AR.UTF-8";
    LC_MONETARY = "es_AR.UTF-8";
    LC_NAME = "es_AR.UTF-8";
    LC_NUMERIC = "es_AR.UTF-8";
    LC_PAPER = "es_AR.UTF-8";
    LC_TELEPHONE = "es_AR.UTF-8";
    LC_TIME = "es_AR.UTF-8";
  };

  # Home Manager overrides live in modules/home-manager.nix
}
