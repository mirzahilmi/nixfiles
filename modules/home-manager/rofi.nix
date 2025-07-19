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

  # didn't use the builtin module because it doesnt
  # allow me specify raw symlinked config, yuck
  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.rofi-wayland];
    xdg.configFile."rofi/config.rasi".source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/mirza/.config/nixfiles/modules/home-manager/rofi.rasi";
  };
}
