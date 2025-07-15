# modules/home-manager/shell/bash.nix
{ config, lib, pkgs, cfg, ... }:

let
  shellToExec = if cfg.zsh.enable then "${pkgs.zsh}/bin/zsh"
                 else if cfg.fish.enable or false then "${pkgs.fish}/bin/fish"
                 else null;

  shellExecCode =
  if shellToExec != null then ''
    echo "BASH INIT EXTRA RUNNING" > /tmp/bash_init_extra.log
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "${builtins.baseNameOf shellToExec}" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${shellToExec} $LOGIN_OPTION
    fi
  '' else "";
in {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = shellExecCode;
  };
}
