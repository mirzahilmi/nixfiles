{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = [pkgs.vimPlugins.telescope-fzf-native-nvim];
  };
  xdg.dataFile."nvim/telescope-fzf-native-nvim".source = pkgs.vimPlugins.telescope-fzf-native-nvim;
}
