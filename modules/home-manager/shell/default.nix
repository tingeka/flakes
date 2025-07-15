# modules/home-manager/shell/default.nix
{ config, lib, pkgs, ... }:

let
  cfg = config.shell;
in {
  options.shell = {
    zsh.enable = lib.mkEnableOption "Enable Z shell";
    bash.enable = lib.mkEnableOption "Enable Bash shell";
    fish.enable = lib.mkEnableOption "Enable Fish shell";
    starship.enable = lib.mkEnableOption "Enable Starship prompt";
    fzf.enable = lib.mkEnableOption "Enable FZF fuzzy finder";
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.bash.enable
      (import ./bash.nix { inherit config lib pkgs cfg; }))

    (lib.mkIf cfg.zsh.enable
      (import ./zsh.nix { inherit config lib pkgs; }))

    (lib.mkIf cfg.fish.enable
      (import ./fish.nix { inherit config lib pkgs; }))

    (lib.mkIf cfg.starship.enable
      (import ./starship.nix { inherit config lib pkgs; }))

    (lib.mkIf cfg.fzf.enable
      (import ./fzf.nix { inherit config lib pkgs; }))
  ];
}

