{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim/" = {
    source = builtins.fetchGit {
      url = "https://github.com/NvChad/NvChad.git";
      rev = "v2.0";
      sha256 = "sha256-J4SGwo/XkKFXvq+Va1EEBm8YOQwIPPGWH3JqCGpFnxY=";
    };
  };
}