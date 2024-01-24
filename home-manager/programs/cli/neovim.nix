{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim" = {
    source = "${pkgs.vimPlugins.nvchad}";
  };
}