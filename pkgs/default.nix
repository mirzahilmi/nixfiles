{
  finalPkgs,
  inputs,
}: {
  bccli = finalPkgs.callPackage ./bccli.nix {};
  draw-on-your-screen = finalPkgs.callPackage ./draw-on-your-screen.nix {};
  grubThemes = {fallout = inputs.grub-themes.packages.${finalPkgs.system}.fallout;};
  neovim = inputs.default-nvim.packages.${finalPkgs.system}.default;
  st-snazzy = import ./st-snazzy {inherit inputs finalPkgs;};
  zen-browser = inputs.zen-browser.packages."${finalPkgs.system}".specific;
}
