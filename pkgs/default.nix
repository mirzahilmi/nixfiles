{
  final,
  prev,
  inputs,
}: {
  bccli = final.callPackage ./bccli.nix {};
  draw-on-your-screen = final.callPackage ./draw-on-your-screen.nix {};
  # ghostty-nightly = inputs.ghostty.packages.${finalPkgs.system}.default;
  grubThemes = {fallout = inputs.grub-themes.packages.${final.system}.fallout;};
  neovim = inputs.nvim.packages.${final.system}.default;
  zen-browser = inputs.zen-browser.packages.${final.system}.default;
  sumatrapdf-wrapper = final.writeShellScriptBin "sumatrapdf-wrapper" (builtins.readFile ./sumatrapdf-wrapper.sh);
  ssh-sign-me-up = final.writeShellScriptBin "ssh-sign-me-up" (builtins.readFile ./ssh-sign-me-up.sh);
  quickshell-git = inputs.quickshell.packages.${final.system}.default;
  qwen-code = final.callPackage ./qwen-code.nix {};
  winapps = inputs.winapps.packages."${final.system}".winapps;
}
