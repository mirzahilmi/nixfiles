{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.rofi;
in {
  options.custom.programs.rofi = {
    enable = lib.mkEnableOption "rofi";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        display-drun = "Applications:";
        display-window = "Windows:";
        drun-display-format = "{icon} {name}";
        show-icons = true;
      };
    };
  };
}
