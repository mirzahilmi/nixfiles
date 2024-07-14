{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    mouse = true;
    secureSocket = true;
    shell = "${pkgs.zsh}/bin/zsh";
    sensibleOnTop = false;
    ## See https://github.com/zsh-users/zsh-autosuggestions/issues/229
    terminal = "screen-256color";
    plugins = with pkgs.tmuxPlugins; [fzf-tmux-url];
    extraConfig = ''
      set -ag terminal-overrides ",''${TERM}:RGB"

      set -g status-style bg=default
      set-option -g set-titles on
      set-option -g set-titles-string "#W"
      set-option -g focus-events on

      # statusbar
      setw -g window-status-current-style 'fg=#000000 bg=green bold'
      setw -g window-status-current-format ' #I #W #F '
      setw -g window-status-format ' #[fg=green]#I #[fg=default]#W #[fg=green]#F '
    '';
  };
}
