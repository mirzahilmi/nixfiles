{
  programs.foot = {
    enable = true;
    settings = builtins.fromTOML readFile ./foot.ini;
  };
}
