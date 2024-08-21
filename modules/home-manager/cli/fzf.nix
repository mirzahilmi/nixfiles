{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    defaultOptions = ["--layout=reverse --info=inline --height=90%"];
  };
}
