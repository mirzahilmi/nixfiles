{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    newSession = true;
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    prefix = "C-Space";
    extraConfig = builtins.readFile ./tmux.conf;
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      yank
    ];
  };
}
