{
  pkgs,
  inputs,
  ...
}: let
  spicetify = inputs.spicetify-nix;
  spicetifyPkgs = spicetify.legacyPackages.${pkgs.system};
in {
  imports = [spicetify.homeManagerModules.default];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicetifyPkgs.extensions; [
      adblock
      hidePodcasts
      history
      beautifulLyrics
      shuffle
      volumePercentage
    ];
  };
}
