{ inputs, outputs, ... }:

{
  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
  };

  programs.git.enable = true;

  home.stateVersion = "23.11";
}