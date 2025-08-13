{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.quickshell;
in {
  options.custom.programs.quickshell = {
    enable = lib.mkEnableOption "quickshell";
  };

  config = lib.mkIf cfg.enable {
    qt.enable = true;
    home.packages = [pkgs.quickshell-git];
    xdg.configFile."quickshell" = {
      recursive = true;
      source =
        config.lib.file.mkOutOfStoreSymlink
        "/home/mirza/.config/nixfiles/modules/home-manager/quickshell";
    };
  };
}
