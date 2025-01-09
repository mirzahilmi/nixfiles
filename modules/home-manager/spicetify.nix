{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.spicetify;
  spicetify-nix = inputs.spicetify-nix;
  spicetifyPkgs = spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [spicetify-nix.homeManagerModules.default];
  options.custom.programs.spicetify = {
    enable = lib.mkEnableOption "spicetify";
  };
  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;
      spicetifyPackage = pkgs.unstable.spicetify-cli;
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
  };
}
