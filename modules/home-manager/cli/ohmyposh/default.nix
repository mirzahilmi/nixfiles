{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableNushellIntegration = false;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./settings.json));
    # settings = builtins.fromTOML (builtins.unsafeDiscardStringContext (builtins.readFile ./zen.toml));
  };
}