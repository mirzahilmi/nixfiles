{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    package = pkgs.unstable.tmux;
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
}
