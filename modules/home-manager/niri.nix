{
  lib,
  config,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.custom.programs.niri.enable {
    xdg.configFile."niri/config.kdl".source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/mirza/.config/nixfiles/modules/home-manager/niri.kdl";
  };
}
