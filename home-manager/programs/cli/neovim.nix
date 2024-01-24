{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim/" = {
    source = (pkgs.callPackage ../../../pkgs/nvchad { }).nvchad;
  };
}