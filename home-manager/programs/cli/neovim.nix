{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim/" = {
    source = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "v2.0";
      sha256 = "sha256-J4SGwo/XkKFXvq+Va1EEBm8YOQwIPPGWH3JqCGpFnxY=";
    };
  };
}