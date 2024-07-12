{
  pkgs ? import <nixpkgs> {},
  prev,
  inputs,
}: {
  draw-on-your-screen = pkgs.callPackage ./draw-on-your-screen.nix {};
  st-snazzy = import ./st-snazzy {inherit inputs pkgs;};
  grubThemes = {fallout = inputs.grub-themes.packages.${pkgs.system}.fallout;};
  # l5p-keyboard-rgb = import ./l5p-keyboard-rgb.nix {inherit inputs pkgs;};
  vimPlugins =
    prev.vimPlugins
    // {
      native-vim-colorschemes = prev.callPackage ./retrobox.nix {};
    };
}
