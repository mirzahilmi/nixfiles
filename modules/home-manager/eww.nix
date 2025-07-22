{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.eww;
in {
  options.custom.programs.eww = {
    enable = lib.mkEnableOption "eww";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.eww];
    xdg.configFile = {
      "eww/eww.yuck".source =
        config.lib.file.mkOutOfStoreSymlink
        "/home/mirza/.config/nixfiles/modules/home-manager/eww.yuck";
      "eww/eww.scss".source =
        config.lib.file.mkOutOfStoreSymlink
        "/home/mirza/.config/nixfiles/modules/home-manager/eww.scss";
    };
  };
}
