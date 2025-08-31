{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.hyprland;
in {
  options.custom.programs.hyprland = {
    enable = lib.mkEnableOption "Hyprland";
  };
  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
    };
  };
}
