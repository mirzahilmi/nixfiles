{ config, ... }:
{
  programs.home-manager = {
    enable = true;
    path = "${config.xdg.configHome}/nixfiles";
  };
}