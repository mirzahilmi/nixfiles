{
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.sway;
in {
  options.custom.programs.sway = {
    enable = lib.mkEnableOption "sway";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      config = {
        modifier = "Mod4";
        terminal = "ghostty";
        keybindings = let
          modifier = config.wayland.windowManager.sway.config.modifier;
        in {
          "${modifier}+space" = "exec rofi -show drun";
        };
      };
    };
  };
}
