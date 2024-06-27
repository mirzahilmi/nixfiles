{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableNushellIntegration = false;
    settings = builtins.fromTOML (builtins.readFile ./zen.toml);
  };
}
