{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  xdg.dataFile."nvim/telescope-fzf-native-nvim".source = pkgs.vimPlugins.telescope-fzf-native-nvim;
}
