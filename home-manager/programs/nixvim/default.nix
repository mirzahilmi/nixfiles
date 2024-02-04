{
  programs.nixvim = {
    enable = true;
    enableMan = true;
    colorschemes.gruvbox.enable = true;
    plugins = {
      lightline.enable = true;
    };
    options = {
      number = true;
      shiftwidth = 2;
    };
  };
}
