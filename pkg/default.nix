{pkgs ? import <nixpkgs> {}}: {
  draw-on-screen = pkgs.callPackage ./draw-on-screen {};
}
