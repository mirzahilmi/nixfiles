{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    mouse = true;
    sensibleOnTop = false;
    # See https://github.com/zsh-users/zsh-autosuggestions/issues/229
    terminal = "screen-256color";
    plugins = with pkgs; [tmuxPlugins.catppuccin];
    extraConfig = ''
      set-option -g status-position top
      set -g status-bg default

      set -g @catppuccin_window_left_separator ""
      set -g @catppuccin_window_right_separator " "
      set -g @catppuccin_window_middle_separator " █"
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_default_fill "number"
      set -g @catppuccin_window_default_text "#W"
      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#W"
      set -g @catppuccin_status_modules_right "directory session"
      set -g @catppuccin_status_left_separator  " "
      set -g @catppuccin_status_right_separator ""
      set -g @catppuccin_status_fill "icon"
      set -g @catppuccin_status_connect_separator "no"
      set -g @catppuccin_status_background "default"
      set -g @catppuccin_directory_text "#{pane_current_path}"
    '';
  };
}
