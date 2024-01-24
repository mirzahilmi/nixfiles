{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim/" = {
    source = (pkgs.callPackage ../../../../modules/home-manager/nvchad.nix{}).nvchad;
  };
}