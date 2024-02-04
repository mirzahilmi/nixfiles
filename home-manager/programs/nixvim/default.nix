{
  programs.nixvim = {
    enable = true;
    enableMan = true;
    colorschemes.gruvbox.enable = true;
    plugins = {
      lualine.enable = true;
    };
    options = {
      number = true;
      shiftwidth = 2;
    };
  };
}
