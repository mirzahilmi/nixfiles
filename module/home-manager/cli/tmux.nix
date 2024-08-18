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
    plugins = with pkgs.tmuxPlugins; [fzf-tmux-url];
    extraConfig = ''
      set -g default-terminal 'tmux-256color'
      set -ag terminal-overrides ',*:RGB'
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      set -g status-style bg=default
      set-option -g set-titles on
      set-option -g set-titles-string '#W'
      set-option -g focus-events on

      # statusbar
      setw -g window-status-current-style 'fg=#1b1b1b bg=green bold'
      setw -g window-status-current-format ' #I #W #F '
      setw -g window-status-format ' #[fg=green]#I #[fg=default]#W #[fg=green]#F '
    '';
  };
}
