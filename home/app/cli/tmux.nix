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
    extraConfig = with pkgs.tmuxPlugins; ''
      set -g @catppuccin_window_left_separator "█"
      set -g @catppuccin_window_right_separator "█ "
      set -g @catppuccin_window_middle_separator " | "
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_default_fill "none"
      set -g @catppuccin_window_current_fill "all"
      set -g @catppuccin_window_default_text "#W"
      set -g @catppuccin_window_current_text "#W"
      set -g @catppuccin_status_modules_right "directory session"
      set -g @catppuccin_status_left_separator  " "
      set -g @catppuccin_status_right_separator ""
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_status_background "#212526"
      set -g @catppuccin_directory_text "#{pane_current_path}"
      run-shell ${catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux
    '';
  };
}
