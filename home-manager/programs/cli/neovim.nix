{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim/" = {
    source = builtins.fetchGit {
      url = "https://github.com/NvChad/NvChad.git";
      rev = "v2.0";
    };
  };
}