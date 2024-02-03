{
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim".source = ../../../legacy-dotfiles/nvim;
}
