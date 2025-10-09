{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.custom.programs.winapps;
in {
  options.custom.programs.winapps = {
    enable = lib.mkEnableOption "winapps";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.winapps];
    # xdg.configFile."winapps/winapps.conf".source =
    #   config.lib.file.mkOutOfStoreSymlink
    #   "/home/mirza/.config/nixfiles/modules/home-manager/winapps.conf";
  };
}
