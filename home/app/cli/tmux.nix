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
      set -g status-style bg=default
      set-option -g set-titles on
      set-option -g set-titles-string "#W"
    '';
  };
}
