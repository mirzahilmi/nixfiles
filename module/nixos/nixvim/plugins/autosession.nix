{
  programs.nixvim = {
    plugins.auto-session = {
      enable = true;
      autoSession = {
        enabled = true;
      };
    };
  };
}
