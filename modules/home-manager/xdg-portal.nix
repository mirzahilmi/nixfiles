{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.xdg-portal;
in {
  options.custom.programs.xdg-portal = {
    enable = lib.mkEnableOption "xdg-portal";
  };

  config = lib.mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      config.common.default = "*";
      extraPortals = with pkgs; [xdg-desktop-portal-gnome];
    };
  };
}
