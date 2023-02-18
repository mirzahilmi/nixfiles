{
  programs.foot = {
    enable = true;
    settings = builtins.fromTOML builtins.readFile ./foot.ini;
  };
}
