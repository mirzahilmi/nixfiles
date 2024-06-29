{
  pkgs ?
    import <nixpkgs> {
      config = {};
      overlays = [];
    },
  inputs,
}: {
  draw-on-your-screen = pkgs.callPackage ./draw-on-your-screen.nix {};
  st-snazzy = import ./st-snazzy {
    inherit (pkgs) system;
    inherit inputs;
  };
}
