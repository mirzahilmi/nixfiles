{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "CascadiaCode"
      "FiraCode"
      "Gohu"
      "IBMPlexMono"
      "JetBrainsMono"
    ];})
    ibm-plex
    times-newer-roman
  ];
}