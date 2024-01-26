{ pkgs, inputs, ... }:
let
  spicetify = inputs.spicetify-nix;
  spicePkgs = spicetify.packages.${pkgs.system}.default;
in {
  imports = [ spicetify.homeManagerModule ];

  programs.spicetify = {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      autoVolume
      fullAppDisplay
      hidePodcasts
      history
      volumePercentage
    ];
  };
}