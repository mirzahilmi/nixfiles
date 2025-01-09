{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.ohmyposh;
in {
  options.custom.programs.ohmyposh = {
    enable = lib.mkEnableOption "ohmyposh";
  };
  config = lib.mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
      enableNushellIntegration = false;
      settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (
        builtins.readFile ./ohmyposh.json
      ));
    };
  };
}
