{
  pkgs ? import <nixpkgs> {},
  inputs,
}: {
  draw-on-your-screen = pkgs.callPackage ./draw-on-your-screen.nix {};
  st-snazzy = import ./st-snazzy {inherit inputs pkgs;};
  grubThemes = {fallout = inputs.grub-themes.packages.${pkgs.system}.fallout;};
}
