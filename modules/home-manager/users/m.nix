# modules/home-manager/m.nix
{ config, pkgs, lib, inputs, ... }:
{
  home.username = "m";
  home.homeDirectory = "/home/m";
  home.stateVersion = "25.05";

  # Import modular components
  imports = [
    ../shell/default.nix
    ../../programs/firefox.nix
#     ./modules/development.nix
#     ./modules/desktop.nix
#     ./modules/system.nix
  ];

  # Personal git configuration
  programs.git = {
    enable = true;
    userName = "Martin Garcia";
    userEmail = "tin.geka@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.editor = "nvim";
    };
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
      lg = "log --oneline --graph --decorate --all";
    };
  };

  # Enable what you want
  shell = {
    zsh.enable = true;
    bash.enable = true;
    fish.enable = false;
    starship.enable = true;
    fzf.enable = true;
  };
}
