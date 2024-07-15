{
  programs.nixvim = {
    plugins.neocord = {
      enable = true;
      settings = {
        logo = "https://i.postimg.cc/VsTYCYRC/neovim-logo.png";
        enable_line_number = true;
        line_number_text = "Line %s out of %s";
        workspace_text = "In %s";
      };
    };
  };
}
