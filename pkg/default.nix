{
  pkgs ? import <nixpkgs> {},
  prev,
  inputs,
}: {
  draw-on-your-screen = pkgs.callPackage ./draw-on-your-screen.nix {};
  tableplus-linux = pkgs.callPackage ./tableplus.nix {};
  st-snazzy = import ./st-snazzy {
    inherit inputs;
    final = pkgs;
  };
  grubThemes = {fallout = inputs.grub-themes.packages.${pkgs.system}.fallout;};
  vimPlugins =
    prev.vimPlugins
    // {
      bg-nvim = pkgs.callPackage ./bg-nvim.nix {};
    };
}
