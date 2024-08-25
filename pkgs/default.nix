{
  pkgs,
  prev,
  inputs,
}: {
  draw-on-your-screen = pkgs.callPackage ./draw-on-your-screen.nix {};
  grubThemes = {fallout = inputs.grub-themes.packages.${pkgs.system}.fallout;};
  neovim = inputs.default-nvim.packages.${pkgs.system}.default;
  st-snazzy = import ./st-snazzy {inherit inputs pkgs;};
}
