{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    terminal = "screen-truecolor";
    prefix = "C-Space";
    disableConfirmationPrompt = true;
    extraConfig = builtins.readFile ./tmux.conf;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
    ];
  };
}
