# modules/home-manager/shell/fish.nix
{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      echo "Welcome to Fish"
    '';
  };
}
