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
      prefix = "C-s";
      secureSocket = true;
      sensibleOnTop = false;
      shell = "${pkgs.zsh}/bin/zsh";

      extraConfig = ''
        set -g default-terminal 'tmux-256color'
        set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
        set -as terminal-overrides ',*:Setulc=\E[58::2::::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
        set-option -g status-position top
        set -g status-style bg=default
        set-option -g renumber-windows on

        # split pane in current dir
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
      '';
    };
  };
}
