{
  programs.zsh.zimfw = {
    enable     = true;
    homeDir    = "$XDG_CONFIG_HOME/zimfw/plugins";
    configFile = "$XDG_CONFIG_HOME/zimfw/zimrc";
    zmodules   = [
      "completion"
      "input"
      "run-help"
      "archive"
      "termtitle"
      "utility"
    ];
  };
}