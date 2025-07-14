{
  lib,
  config,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.custom.programs.niri;
in {
  imports = [inputs.niri.homeModules.niri];

  options.custom.programs.niri = {
    enable = lib.mkEnableOption "niri";
  };

  config = lib.mkIf cfg.enable {
    programs.niri = {
      enable = true;
      package = pkgs.unstable.niri;
    };
    xdg.configFile."niri/config.kdl".source =
      config.lib.file.mkOutOfStoreSymlink
      "/home/mirza/.config/nixfiles/modules/home-manager/niri.kdl";
  };
}
