{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.custom.programs.tmux;
in {
  options.custom.programs.tmux = {
    enable = lib.mkEnableOption "Tmux";
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      secureSocket = true;
      extraConfig = builtins.readFile ./tmux.conf;
      plugins = builtins.attrValues {
        inherit (pkgs.tmuxPlugins) fingers;
      };
    };
  };
}
