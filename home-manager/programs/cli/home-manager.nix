{ config, lib, ... }:
{
  programs.home-manager = {
    enable = lib.mkDefault true;
    path = "${config.xdg.configHome}/nixfiles";
  };
}