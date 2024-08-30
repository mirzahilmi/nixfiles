{
  pkgs,
  inputs,
  ...
}: let
  spicetify-nix = inputs.spicetify-nix;
  spicetifyPkgs = spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [spicetify-nix.homeManagerModules.default];
  programs.spicetify = {
    enable = true;
    enabledCustomApps = with spicetifyPkgs.apps; [
      betterLibrary
      historyInSidebar
      localFiles
      lyricsPlus
      marketplace
      nameThatTune
    ];
    enabledExtensions = with spicetifyPkgs.extensions; [
      # adblock
      beautifulLyrics
      hidePodcasts
      history
      shuffle
      volumePercentage
    ];
  };
}
