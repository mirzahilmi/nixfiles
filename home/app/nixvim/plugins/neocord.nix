{
  programs.nixvim = {
    plugins.neocord = {
      enable = true;
      settings = {
        enable_line_number = true;
      };
    };
  };
}

