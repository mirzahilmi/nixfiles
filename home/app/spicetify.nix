{
  pkgs,
  inputs,
  ...
}: let
  spicetify = inputs.spicetify-nix;
in {
  imports = [spicetify.homeManagerModule];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicetify.packages.${pkgs.system}.default.extensions; [
      adblock
      hidePodcasts
      history
      volumePercentage
    ];
  };
}
