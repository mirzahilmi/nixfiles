{ inputs, outputs, ... }:

{
  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
  };

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  programs.git.enable = true;

  home.stateVersion = "23.11";
}