# modules/home-manager/shell/zsh.nix
{ config, lib, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
    oh-my-zsh.plugins = [ "git" ];
  };
}
