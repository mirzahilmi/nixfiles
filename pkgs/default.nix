{
  pkgs,
  prev,
  inputs,
}: {
  bccli = pkgs.callPackage ./bccli.nix {};
  draw-on-your-screen = pkgs.callPackage ./draw-on-your-screen.nix {};
  grubThemes = {fallout = inputs.grub-themes.packages.${pkgs.system}.fallout;};
  neovim = inputs.default-nvim.packages.${pkgs.system}.default;
  st-snazzy = import ./st-snazzy {inherit inputs pkgs;};
  zen-browser = inputs.zen-browser.packages."${pkgs.system}".specific;
}
