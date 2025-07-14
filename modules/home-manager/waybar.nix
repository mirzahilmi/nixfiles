{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.waybar;
in {
  options.custom.programs.waybar = {
    enable = lib.mkEnableOption "waybar";
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
    };
  };
}
