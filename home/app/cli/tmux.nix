{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    terminal = "screen-256color";
    prefix = "C-Space";
    disableConfirmationPrompt = true;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];
    extraConfig = ''

    '';
  };
}
