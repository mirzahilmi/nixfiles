{pkgs ? import <nixpkgs> {}}: {
  draw-on-your-screen = pkgs.callPackage ./draw-on-your-screen.nix {};
  tableplus-custom = pkgs.callPackage ./tableplus.nix {};
}
