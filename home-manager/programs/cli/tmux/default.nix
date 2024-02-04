{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    newSession = true;
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    prefix = "C-Space";
    disableConfirmationPrompt = true;
    extraConfig = builtins.readFile ./tmux.conf;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox 
      yank
    ];
  };
}
