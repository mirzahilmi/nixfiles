{config, ...}: {
  programs.bash = {
    enable = true;
    historyFileSize = 1000;
    historySize = 1000;
    historyFile = "${config.xdg.configHome}/bash/history";
  };
}
