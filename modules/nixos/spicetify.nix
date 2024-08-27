{
  pkgs,
  inputs,
  lib,
  ...
}: let
  spicetify-nix = inputs.spicetify-nix;
  spicetifyPkgs = spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [spicetify-nix.nixosModules.default];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];
  programs.spicetify = {
    enable = true;
    alwaysEnableDevTools = true;
    enabledCustomApps = with spicetifyPkgs.apps; [
      betterLibrary
      historyInSidebar
      localFiles
      lyricsPlus
      marketplace
      nameThatTune
    ];
    enabledExtensions = with spicetifyPkgs.extensions; [
      adblock
      beautifulLyrics
      hidePodcasts
      history
      shuffle
      volumePercentage
    ];
  };
}
