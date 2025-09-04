{
  lib,
  config,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.custom.programs.i3.enable {
    xdg.configFile."i3/config".source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/mirza/.config/nixfiles/modules/home-manager/i3";
  };
}
