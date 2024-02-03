{pkgs ? import <nixpkgs> {}}: {
  nixovim = pkgs.callPackage ./nixovim {};
}
