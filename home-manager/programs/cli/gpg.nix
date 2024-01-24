{ config, ... }:
{
  programs.gpg = {
    enable = true;
    homedir = "${xdg.dataHome}/gnupg";
  };
}