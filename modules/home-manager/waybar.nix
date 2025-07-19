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
      style =
        config.lib.file.mkOutOfStoreSymlink
        "/home/mirza/.config/nixfiles/modules/home-manager/waybar.css";
    };
    xdg.configFile."waybar/config".source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/mirza/.config/nixfiles/modules/home-manager/waybar.jsonc";
  };
}
