{ pkgs, inputs, outputs, ... }:
{
  imports = [
    ../programs/gnome-tweaks
  ];

  home = {
    username = "mirza";
    homeDirectory = "/home/mirza";
  };

  dconf.enable = true;

  home.packages = with pkgs; [
    floorp
    vesktop
    cool-retro-term
  ];

  home.stateVersion = "23.11";
}