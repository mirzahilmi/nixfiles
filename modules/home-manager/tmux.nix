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
    shell = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.zsh}/bin/zsh";
      example = "/usr/bin/zsh";
      description = "default shell absolute path";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      disableConfirmationPrompt = true;
      escapeTime = 0;
      historyLimit = 10000;
      mouse = true;
      secureSocket = true;
      sensibleOnTop = false;
      shell = "${pkgs.zsh}/bin/zsh";
      extraConfig = builtins.readFile ./tmux.conf;
    };
  };
}
